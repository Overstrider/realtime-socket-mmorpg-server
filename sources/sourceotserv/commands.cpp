#include "otpch.h"

#include <sstream>
#include <string>
#include <utility>

#include <boost/tokenizer.hpp>
typedef boost::tokenizer<boost::char_separator<char>> tokenizer;

#include "Actions.h"
#include "ban.h"
#include "commands.h"
#include "configmanager.h"
#include "game.h"
#include "globalevent.h"
#include "house.h"
#include "ioplayer.h"
#include "monsters.h"
#include "movement.h"
#include "npc.h"
#include "player.h"
#include "raids.h"
#include "spells.h"
#include "spells.h"
#include "talkaction.h"
#include "tools.h"
#include "town.h"
#include "weapons.h"

#ifdef __ENABLE_SERVER_DIAGNOSTIC__
#include "connection.h"
#include "outputmessage.h"
#include "protocollogin.h"
#include "status.h"
#endif

#include <libxml/parser.h>
#include <libxml/xmlmemory.h>

extern ConfigManager g_config;
extern Actions* g_actions;
extern Monsters g_monsters;
extern BanManager g_bans;
extern Npcs g_npcs;
extern TalkActions* g_talkactions;
extern MoveEvents* g_moveEvents;
extern Spells* g_spells;
extern Weapons* g_weapons;
extern CreatureEvents* g_creatureEvents;
extern Game g_game;
extern GlobalEvents* g_globalEvents;

extern bool readXMLInteger(xmlNodePtr p, const char* tag, int& value);

#define ipText(a)                                                                           \
	(unsigned int)a[0] << "." << (unsigned int)a[1] << "." << (unsigned int)a[2] << "." \
	                   << (unsigned int)a[3]

// table of commands
s_defcommands Commands::defined_commands[] = {{ "!kills", &Commands::playerKills }
};


Commands::Commands()
{
	loaded = false;

	// setup command map
	for (uint32_t i = 0; i < sizeof(defined_commands) / sizeof(defined_commands[0]); i++) {
		Command* cmd = new Command;
		cmd->loaded = false;
		cmd->accesslevel = 1;
		cmd->f = defined_commands[i].f;
		std::string key = defined_commands[i].name;
		commandMap[key] = cmd;
	}
}

bool Commands::loadXml(const std::string& _datadir)
{
	datadir = _datadir;
	std::string filename = datadir + "commands.xml";

	xmlDocPtr doc = xmlParseFile(filename.c_str());
	if (doc) {
		loaded = true;
		xmlNodePtr root, p;
		root = xmlDocGetRootElement(doc);

		if (xmlStrcmp(root->name, (const xmlChar*)"commands") != 0) {
			xmlFreeDoc(doc);
			return false;
		}

		std::string strCmd;

		p = root->children;

		while (p) {
			if (xmlStrcmp(p->name, (const xmlChar*)"command") == 0) {
				if (readXMLString(p, "cmd", strCmd)) {
					CommandMap::iterator it = commandMap.find(strCmd);
					int alevel;
					if (it != commandMap.end()) {
						if (readXMLInteger(p, "access", alevel)) {
							if (!it->second->loaded) {
								it->second->accesslevel = alevel;
								it->second->loaded = true;
							} else {
								std::cout << "Duplicated command "
								          << strCmd << std::endl;
							}
						} else {
							std::cout << "missing access tag for "
							          << strCmd << std::endl;
						}
					} else {
						// error
						std::cout << "Unknown command " << strCmd << std::endl;
					}
				} else {
					std::cout << "missing cmd." << std::endl;
				}
			}
			p = p->next;
		}
		xmlFreeDoc(doc);
	}

	//
	for (CommandMap::iterator it = commandMap.begin(); it != commandMap.end(); ++it) {
		if (it->second->loaded == false) {
			std::cout << "Warning: Missing access level for command " << it->first << std::endl;
		}
		// register command tag in game
		g_game.addCommandTag(it->first.substr(0, 1));
	}


	return this->loaded;
}

bool Commands::reload()
{
	loaded = false;
	for (CommandMap::iterator it = commandMap.begin(); it != commandMap.end(); ++it) {
		it->second->accesslevel = 1;
		it->second->loaded = false;
	}
	g_game.resetCommandTag();

	loadXml(datadir);
	return true;
}

bool Commands::exeCommand(Creature* creature, const std::string& cmd)
{
	std::string str_command;
	std::string str_param;

	std::string::size_type loc = cmd.find(' ', 0);
	if (loc != std::string::npos && loc >= 0) {
		str_command = std::string(cmd, 0, loc);
		str_param = std::string(cmd, (loc + 1), cmd.size() - loc - 1);
	} else {
		str_command = cmd;
		str_param = std::string("");
	}

	// find command
	CommandMap::iterator it = commandMap.find(str_command);
	if (it == commandMap.end()) {
		return false;
	}

	Player* player = creature->getPlayer();
	// check access for this command
	if (player && player->getAccessLevel() < it->second->accesslevel) {
		if (player->getAccessLevel() > 0) {
			player->sendTextMessage(MSG_STATUS_SMALL,
			                        "You can not execute this command.");
		}

		return false;
	}

	// execute command
	CommandFunc cfunc = it->second->f;
	(this->*cfunc)(creature, str_command, str_param);
	if (player) player->sendTextMessage(MSG_STATUS_CONSOLE_RED, cmd.c_str());

	return true;
}

bool Commands::playerKills(Creature* creature, const std::string& cmd, const std::string& param)
{
	if (Player* player = creature->getPlayer()) {
		int32_t fragTime = g_config.getNumber(ConfigManager::FRAG_TIME);
		if (player->skullTicks && fragTime > 0) {
			int32_t frags = (player->skullTicks / fragTime) + 1;
			int32_t remainingTime = player->skullTicks - (fragTime * (frags - 1));
			int32_t hours = ((remainingTime / 1000) / 60) / 60;
			int32_t minutes = ((remainingTime / 1000) / 60) - (hours * 60);

			char buffer[175];
			sprintf(buffer, "You have %d unjustified kill%s. The amount of unjustified "
			                "kills will decrease after: %s.",
			        frags, (frags > 1 ? "s" : ""), formatTime(hours, minutes).c_str());
			player->sendTextMessage(MSG_STATUS_CONSOLE_BLUE, buffer);
		} else {
			player->sendTextMessage(MSG_STATUS_CONSOLE_BLUE,
			                        "You do not have any unjustified kill.");
		}
	}

	return false;
}