--[[
* Licensed under GNU General Public License v2
* (c) 2013, Luca CPZ
* Modified for Intel CPU on Arch Linux
]]

local helpers = require("lain.helpers")
local wibox = require("wibox")
local awful = require("awful")

-- {thermal} temperature info
-- lain.widget.temp_intel
local function factory(args)
    local temp = { widget = wibox.widget.textbox() }
    local args = args or {}
    local timeout = args.timeout or 30
    local settings = args.settings or function() end

    function temp.update()
        awful.spawn.easy_async("sensors", function(stdout)
            local temp_line = stdout:match("Package id 0:.-(%+%d+%.%d°C)")
            coretemp_now = temp_line and temp_line:match("%d+") or "N/A"
            widget = temp.widget
            settings()
        end)
    end

    helpers.newtimer("thermal", timeout, temp.update)

    return temp
end

return factory