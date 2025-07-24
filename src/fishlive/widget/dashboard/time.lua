local wibox = require("wibox")
local beautiful = require("beautiful")

local refresh = 1

local hours = wibox.widget.textclock()
hours.font = beautiful.font_board_mono.."38"
hours.format = "%I"

local minutes = wibox.widget.textclock()
minutes.font = beautiful.font_board_mono.."38"
minutes.format = "<span foreground='"..beautiful.base0E.."'>%M</span>"

local seconds = wibox.widget.textclock()
seconds.font = beautiful.font_board_mono.."38"
seconds.format = "<span foreground='"..beautiful.bg_urgent.."'>%S</span>"
seconds.visible = true
seconds:set_refresh(refresh)

local am_pm = wibox.widget.textclock()
am_pm.font = beautiful.font_board_mono.."38"
am_pm.format = "<span foreground='"..beautiful.base0B.."'>%p</span>"

local w = wibox.widget {
    hours,
    minutes,
    seconds,
    am_pm,
    spacing = 5,
    layout = wibox.layout.fixed.horizontal
}

w:connect_signal('button::press', function(_, _, _, button)
  if button == 1 then
    seconds.visible = not seconds.visible
    refresh = 1
    if not seconds.visible then refresh = 60 end
    seconds:set_refresh(refresh)
  end
end)

return w
