--[[
* Licensed under GNU General Public License v2
* (c) 2013, Luca CPZ
* Modified for NVIDIA GPU on Arch Linux
]]

local helpers = require("lain.helpers")
local wibox = require("wibox")
local awful = require("awful")

-- {gputemp} temperature info
-- lain.widget.temp_gpu
local function factory(args)
    local temp = { widget = wibox.widget.textbox() }
    local args = args or {}
    local timeout = args.timeout or 30
    local settings = args.settings or function() end

    function temp.update()
        awful.spawn.easy_async("nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits", function(stdout)
            gputemp_now = stdout:match("%d+") or "N/A"
            widget = temp.widget
            settings()
        end)
    end

    helpers.newtimer("gputemp", timeout, temp.update)

    return temp
end

return factory