os.loadAPI("buttons.lua")

-- Load configuration file.
local CONFIG_FILE_NAME = "weather.config"
local config = {}

function loadConfig()
    if fs.exists(CONFIG_FILE_NAME) then
        local configFile = fs.open(CONFIG_FILE_NAME)
        status, config = textutils.unserialize(configFile.readAll())
        if status == true then
            if string.len(config.id) ~= 10 then return false end
            if tonumber(config.sendPort) == nil then return false end
            if peripheral.getType(config.modemName) ~= "modem" then return false end
            return true
        end
    end
    return false
end

if loadConfig() == false then
    shell.run("config.lua")
    loadConfig()
end

local modem = peripheral.wrap(config.modemName)

local sendCommand = function(cmd)
    modem.transmit(config.sendPort, 0, config.id .. cmd)
end

local quitHandle = function()
    return true
end

local shutdownHandle = function()
    os.shutdown()
end

local modem = peripheral.wrap(MODEM_SIDE)

buttons.init(colors.black)

buttons.createButtonC(4, 2, 20, 3, "Blue Skies", colors.blue, colors.white, function() sendCommand("stopRain") end)
buttons.createButtonC(4, 6, 20, 3, "Gentle Showers", colors.blue, colors.white, function() sendCommand("startRain") end)

buttons.createButtonC(4, 11, 20, 3, "A New Dawn", colors.blue, colors.white, function() sendCommand("sunrise") end)
buttons.createButtonC(4, 15, 20, 3, "Under the Moon", colors.blue, colors.white, function() sendCommand("moonrise") end)

buttons.createButtonC(2, 20, 9, 1, "Access OS", colors.black, colors.white, quitHandle)
buttons.createButtonC(18, 20, 8, 1, "Shutdown", colors.black, colors.white, shutdownHandle)

buttons.run()

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1, 1)