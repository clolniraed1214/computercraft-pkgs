local buttons = {}
local bgColor = 0

function init(c_bg)
    buttons = {}
    bgColor = c_bg
end

function createButton(x, y, w, h, text, handle)
    createButtonC(x, y, w, h, text, colors.white, colors.black, handle)
end

function createButtonC(x, y, w, h, text, c_bg, c_txt, handle)
    local button = {}
    button.x = x
    button.y = y
    button.w = w
    button.h = h
    button.text = text
    button.c_bg = c_bg
    button.c_txt = c_txt
    button.handle = handle
    
    table.insert(buttons, button)
end

local function drawButtons()
    for _, b in ipairs(buttons) do
        local strLen = string.len(b.text)
        local textX = math.floor((b.w - strLen) / 2) + b.x
        local textY = math.floor((b.h - 1)/ 2) + b.y -- FIXME, I THINK I'M BROKE
        
        paintutils.drawFilledBox(b.x, b.y, b.x + b.w - 1, b.y + b.h - 1, b.c_bg)
        term.setTextColor(b.c_txt)
        term.setBackgroundColor(b.c_bg)
        term.setCursorPos(textX, textY)
        term.write(b.text)
    end
end

local function getClickedButton(x, y)
    for _, b in ipairs(buttons) do
        -- Check if this button was clicked
        if b.x <= x and x <= (b.x + b.w - 1) then
            if b.y <= y and y <= (b.y + b.h - 1) then
                return b
            end
        end
    end
    return nil
end

function run()

    local keepRunning = true
    
    while keepRunning == true do
        term.setBackgroundColor(bgColor)
        term.clear()
        
        drawButtons()
        
        local _, mouseButton, x, y = os.pullEvent("mouse_click")
        if mouseButton == 1 then
        
            local clicked = getClickedButton(x, y)
            if clicked ~= nil then
                local stop = clicked.handle()
                if stop == true then
                    keepRunning = false
                end
            end
            
        end
    end
    
end