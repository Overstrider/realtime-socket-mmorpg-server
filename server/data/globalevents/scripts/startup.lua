function onStartup()

	print(":: StartUp - " ..os.date("%d %b %Y %X", (os.time())))
	setGlobalStorageValue(STORAGE.swordFury, -1)
	db.executeQuery("UPDATE houses SET rent = tiles * 150;")
end