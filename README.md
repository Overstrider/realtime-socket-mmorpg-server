# 🎮 Realtime Socket WebServer MMORPG - Odirion

A real-time socket-based MMORPG server offering a complete and immersive online multiplayer gaming experience.

## 📋 About the Project

This project is an MMORPG (Massively Multiplayer Online Role-Playing Game) server developed with real-time client-server architecture. It offers all the features expected from an Oldtimes MMORPG, including combat system, NPCs, quests, guilds, houses and much more.

## 🏗️ Architecture

The project is organized into three main components:

### 🖥️ Client (`Client/`)
- **Engine**: developed in C++
- **Interface**: Modular system with modern UI
- **Resources**: Sprites, sounds, fonts and game data
- **Modules**: Extensible functionality system

### 🖧 Server (`server/`)
- **System**: Complete real-time game management
- **Data**: NPCs, monsters, spells, items and maps
- **Scripts**: Extensible event and action system

### 🗄️ Database (`Schema/`)
- **System**: MySQL for data persistence
- **Content**: Accounts, characters, guilds, houses and more

## ✨ Main Features

### 🎯 Game System
- ⚔️ **Real-Time Combat**: Advanced PvP and PvE system
- 🏰 **Persistent World**: Large and detailed map
- 👥 **Guilds**: Complete guild system
- 🏠 **House System**: Properties for players
- 📦 **Inventory**: Complete items and containers system
- 🗺️ **Minimap**: Interactive navigation

### 🎭 Content
- 👹 **125+ Monsters**: Various types of creatures
- 🤖 **340+ NPCs**: Interactive non-player characters
- ⚡ **Spells System**: Magic and skills
- 🎒 **Thousands of Items**: Equipment, consumables and more
- 🏆 **Quests**: Missions and adventures

### 🔧 Administration
- 🛡️ **Ban System**: Player control
- 📊 **Detailed Logs**: Complete monitoring
- ⚙️ **Flexible Configuration**: Rates, experience, etc.
- 🔐 **Security**: Robust authentication system

## 🚀 Setup and Installation

### 📋 Prerequisites

```bash
# Server
- Lua 5.1+
- MySQL 5.5+
- Network libraries (sockets)

# Client
- Visual Studio 2019+ (Windows)
- CMake 3.16+
- OpenGL
- DirectX (optional)
```

### ⚙️ Server Configuration

1. **Configure the database**:
```sql
-- Import the schema
mysql -u root -p < Schema/sv_dados.sql
```

2. **Configure the server**:
```lua
-- Edit server/config.lua
servername = "Your Server"
ip = "127.0.0.1"
login_port = "7171"
game_port = "7172"
```

### 🎮 Client Configuration

1. **Compile the client**:
```bash
cd Client/otc
mkdir build && cd build
cmake ..
make
```

2. **Configure the connection**:
- Run the client
- Add the server to the list
- Configure IP and port

## 📊 Rate Settings

The server offers flexible experience and loot configurations:

```lua
-- Experience and skill rates
rate_exp = 1           -- Experience
rate_skill = 6         -- Skills
rate_mag = 4           -- Magic
rate_loot = 3          -- Loot
rate_spawn = 2         -- Monster spawn
```

## 🌐 World Types

```lua
-- PvP configurations
worldtype = "pvp"      -- options: pvp, no-pvp, pvp-enforced
```

## 🎨 Client Interface

The client offers a modern and intuitive interface:

- **Inventory**: Drag & drop item management
- **Chat**: Multiple channel system
- **Minimap**: Real-time navigation
- **Status**: HP, MP, skills and conditions
- **Battle**: List of creatures in combat
- **VIP List**: Online friends list

## 🔧 Client Modules

```
client_background/     - Background screen
client_entergame/      - Login and character selection
client_options/        - Client settings
game_battle/           - Combat system
game_console/          - Chat and console
game_containers/       - Containers and bags
game_hotkeys/          - Hotkeys
game_interface/        - Main interface
game_minimap/          - Minimap
game_skills/           - Skills
game_viplist/          - VIP list
```

## 📁 Server Data Structure

```
actions/               - Item action scripts
creaturescripts/       - Creature event scripts
globalevents/          - Server global events
movements/             - Movement scripts
npc/                   - NPCs and their scripts
spells/                - Magic system
talkactions/           - Chat commands
weapons/               - Weapon system
```

## 🛠️ Development

### 🔍 Debugging

The server offers detailed logs:

```lua
-- Available logs
g_logger.info("Information")
g_logger.error("Error")
g_logger.warning("Warning")
```

### 📝 Creating Content

**Adding an NPC**:
```lua
-- In data/npc/name.xml
<?xml version="1.0" encoding="UTF-8"?>
<npc name="Name" script="data/npc/scripts/name.lua">
    <health now="100" max="100"/>
    <look typeex="1337"/>
</npc>
```

**Creating a Spell**:
```lua
-- In data/spells/scripts/
local spell = Spell("instant")
spell:name("Spell Name")
spell:words("magic words")
spell:execute(function(player, target)
    -- Spell logic
end)
spell:register()
```

## 🔐 Security

- **Validation**: Client data verification
- **Rate Limiting**: Spam protection
- **Logs**: Suspicious activity monitoring

## 📈 Performance

### Server Optimizations
- **Algorithms**: Optimized pathfinding
- **Memory**: Efficient resource management
- **Network**: Data compression
- **Cache**: Smart caching system

### Recommended Metrics
- **Players**: Up to 1000 simultaneous
- **RAM**: 2GB minimum, 4GB recommended
- **CPU**: Multi-core recommended
- **Network**: 100Mbps for public server

**Developed with ❤️ for the MMORPG community**
