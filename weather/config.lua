local function enterConfig()
    local config = {}
    term.clear()
    term.setCursorPos(1, 1)
    
    write("Enter port: ")
    config.sendPort = tonumber(read())
    while config.sendPort == nil do
        print("Invalid port!")
        write("Try again: ")
        config.sendPort = tonumber(read())
    end
    
    write("Enter ID: ")
    config.id = read()
    while string.len(config.id) ~= 10 do
        print("ID must be 10 characters.")
        write("Enter ID: ")
        config.id = read()
    end
    
    for _, name in ipairs(peripheral.getNames()) do
        if peripheral.getType( name ) == "modem" then
            config.modemName = name
            break
        end
    end
    
    return config
end

local config = enterConfig()

local configfile = fs.open("weather.config", "w")
configFile.write(textutils.serialize(config))
configFile.close()
