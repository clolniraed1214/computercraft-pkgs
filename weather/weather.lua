os.loadAPI("buttons.lua")

local modemSide = [SIDE]
local sendPort = [PORT]
local id = [ID]

local modem = peripheral.wrap(modemSide)

local rainHandle = function()
    modem.transmit(8080, 0, id .. "startRain")
end

local clearHandle = function()
    modem.transmit(8080, 0, id .. "stopRain")
end

local sunriseHandle = function()
    modem.transmit(8080, 0, id .. "sunrise")
end

local moonriseHandle = function()
    modem.transmit(8080, 0, id .. "moonrise")
end

local quitHandle = function()
    return true
end

local shutdownHandle = function()
    os.shutdown()
end

buttons.init(colors.black)

buttons.createButtonC(4, 2, 20, 3, "Blue Skies", colors.blue, colors.white, clearHandle)
buttons.createButtonC(4, 6, 20, 3, "Gentle Showers", colors.blue, colors.white, rainHandle)

buttons.createButtonC(4, 11, 20, 3, "A New Dawn", colors.blue, colors.white, sunriseHandle)
buttons.createButtonC(4, 15, 20, 3, "Under the Moon", colors.blue, colors.white, moonriseHandle)

buttons.createButtonC(2, 20, 9, 1, "Access OS", colors.black, colors.white, quitHandle)
buttons.createButtonC(18, 20, 8, 1, "Shutdown", colors.black, colors.white, shutdownHandle)

buttons.run()

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1, 1)