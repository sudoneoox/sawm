--  _ __ __ ___   _____ _ __
-- | '__/ _` \ \ / / _ \ '_  \  Antonin Fischer (raven2cz)
-- | | | (_| |\ V /  __/ | | |  https://fishlive.org/
-- |_|  \__,_| \_/ \___|_| |_|  https://github.com/raven2cz
--
-- A customized theme.lua for awesomewm-git (Master) / Multicolor Theme (https://github.com/raven2cz)
------------------------
-- Multicolor Theme  --
------------------------

local theme_name = "multicolor"

local capi = {
  awesome = awesome,
  screen = screen,
  client = client,
}
local theme_assets = require("beautiful.theme_assets")
local awful = require("awful")
local gfs = require("gears.filesystem")
local gears = require("gears")
local gcolor = require("gears.color")
local themes_path = gfs.get_themes_dir()
local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi
local config = require("config")
-- Widget and layout library
local wibox = require("wibox")
-- Window Enhancements
local lain = require("lain")
-- Fishlive Utilities
local fishlive = require("fishlive")
local config = require("config")
local colorscheme = require("fishlive.colorscheme")
local collage = require("fishlive.collage")
local fhelpers = require("fishlive.helpers")
local broker = require("fishlive.signal.broker")
local active_corners = require("fishlive.active_corners")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Screen Resolution (fullhd=1920x1080+0+0, 4K=3840x2160+0+0, 2K=2048x1080+0+0)
local scr_res = fhelpers.screen_resolution()
local isFullhd = scr_res == "1920x1080+0+0"

-- {{{ Main
-- load colorscheme and prepare theme defaults
local theme = fishlive.colorscheme.default
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name
theme.icon_path = theme.dir .. "/icons/"
-- }}}


-- activate random seed by time
math.randomseed(os.time())
-- To guarantee unique random numbers on every platform, pop a few
for i = 1, 10 do
  math.random()
end

-- {{{ Styles
-- Global font
theme.font = "Iosevka NFP 9"
theme.font_larger = "Iosevka NFP 11"
theme.font_notify = "mononoki Nerd Font Propo 11"
theme.menu_font = "mononoki Nerd Font Propo 11"
theme.tabbar_font = "Iosevka NFP 11"
theme.icon_font = "Iosevka NFP "
theme.operator_font = "OperatorMono Book "
-- Dashboard font
theme.font_board_reg = "Roboto Regular "
theme.font_board_med = "Roboto Medium "
theme.font_board_bold = "Roboto Bold "
theme.font_board_mono = "Fira Mono "
theme.font_board_monob = "Fira Mono Bold "
-- }}}

-- {{{ Borders
theme.useless_gap = dpi(5)
theme.border_width = dpi(1)
-- }}}

-- {{{ Menu
theme.menu_height = dpi(5)
theme.menu_width = dpi(100)
-- }}}

-- {{{ Notification Center
theme.clear_icon = theme.dir .. "/icons/clear.png"
theme.clear_grey_icon = theme.dir .. "/icons/clear_grey.png"
theme.notification_icon = theme.dir .. "/icons/notification.png"
theme.delete_icon = theme.dir .. "/icons/delete.png"
theme.delete_grey_icon = theme.dir .. "/icons/delete_grey.png"
theme.border_radius = dpi(0)
theme.wibar_height = dpi(27)
theme.bar_height = dpi(22)
-- }}}

-- {{{ Icons
-- Desktop Icons
theme.icon_theme = "Adwaita"

-- {{{ Taglist
theme.taglist_squares_sel = theme.dir .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = theme.dir .. "/taglist/squarez.png"
-- }}}

-- {{{ Misc
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.awesome_icon_bg, theme.awesome_icon_fg)
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Dashboard
theme.avatar = theme.icon_path .. "avatar.png"
theme.next_icon = theme.icon_path .. "next_focus.png"
theme.next_grey_icon = theme.icon_path .. "next_grey.png"
theme.previous_icon = theme.icon_path .. "previous_focus.png"
theme.previous_grey_icon = theme.icon_path .. "previous_grey.png"
theme.nocover_icon = theme.icon_path .. "nocover.jpg"
-- }}}

-- {{{ Layout
theme.layout_tile = gcolor.recolor_image(theme.dir .. "/layouts/tile.png", theme.layout_fg)
theme.layout_tileleft = gcolor.recolor_image(theme.dir .. "/layouts/tileleft.png", theme.layout_fg)
theme.layout_tilebottom = gcolor.recolor_image(theme.dir .. "/layouts/tilebottom.png", theme.layout_fg)
theme.layout_tiletop = gcolor.recolor_image(theme.dir .. "/layouts/tiletop.png", theme.layout_fg)
theme.layout_fairv = gcolor.recolor_image(theme.dir .. "/layouts/fairv.png", theme.layout_fg)
theme.layout_fairh = gcolor.recolor_image(theme.dir .. "/layouts/fairh.png", theme.layout_fg)
theme.layout_spiral = gcolor.recolor_image(theme.dir .. "/layouts/spiral.png", theme.layout_fg)
theme.layout_dwindle = gcolor.recolor_image(theme.dir .. "/layouts/dwindle.png", theme.layout_fg)
theme.layout_max = gcolor.recolor_image(theme.dir .. "/layouts/max.png", theme.layout_fg)
theme.layout_fullscreen = gcolor.recolor_image(theme.dir .. "/layouts/fullscreen.png", theme.layout_fg)
theme.layout_magnifier = gcolor.recolor_image(theme.dir .. "/layouts/magnifier.png", theme.layout_fg)
theme.layout_floating = gcolor.recolor_image(theme.dir .. "/layouts/floating.png", theme.layout_fg)
theme.layout_cornernw = gcolor.recolor_image(theme.dir .. "/layouts/cornernw.png", theme.layout_fg)
theme.layout_cornerne = gcolor.recolor_image(theme.dir .. "/layouts/cornerne.png", theme.layout_fg)
theme.layout_cornersw = gcolor.recolor_image(theme.dir .. "/layouts/cornersw.png", theme.layout_fg)
theme.layout_cornerse = gcolor.recolor_image(theme.dir .. "/layouts/cornerse.png", theme.layout_fg)
theme.layout_cascade = gcolor.recolor_image(theme.dir .. "/layouts/cascade.png", theme.layout_fg)
theme.layout_cascadetile = gcolor.recolor_image(theme.dir .. "/layouts/cascadetile.png", theme.layout_fg)
theme.layout_centerfair = gcolor.recolor_image(theme.dir .. "/layouts/centerfair.png", theme.layout_fg)
theme.layout_centerwork = gcolor.recolor_image(theme.dir .. "/layouts/centerwork.png", theme.layout_fg)
theme.layout_centerworkh = gcolor.recolor_image(theme.dir .. "/layouts/centerworkh.png", theme.layout_fg)
theme.layout_termfair = gcolor.recolor_image(theme.dir .. "/layouts/termfair.png", theme.layout_fg)
theme.layout_treetile = gcolor.recolor_image(theme.dir .. "/layouts/treetile.png", theme.layout_fg)
theme.layout_machi = gcolor.recolor_image(theme.dir .. "/layouts/machi.png", theme.layout_fg)
-- }}}
---------------------
-- Tabbed support
---------------------
theme.tabbar_position = "bottom"
theme.tabbar_size = 30
theme.tabbar_bg_focus = theme.bg_minimize
theme.mstab_tabbar_style = "default"
theme.mstab_tabbar_position = "top"
---------------------
-- Wallpaper Support
---------------------
-- {{{ Tag Wallpaper
-- CONFIGURE IT: Set according to cloud wallpaper directory
local wppath = os.getenv("HOME") .. "/.config/awesome/assets/wallpapers/"
local wppath_user = os.getenv("HOME") .. "/.config/awesome/assets/wallpapers/"
local wppath_colorscheme = os.getenv("HOME") .. "/.config/awesome/assets/colorscheme/" .. theme.scheme_id .. "/"
local sel_portrait = fhelpers.first_line(os.getenv("HOME") .. "/.portrait") or "joy"
local notifpath = os.getenv("HOME") .. "/.config/awesome/assets/wallpapers/portrait/"
local notifpath_user = notifpath .. sel_portrait .. "/"
if not fhelpers.is_dir(notifpath_user) then
  notifpath_user = notifpath .. "default/"
end
local notif_user = {}
-- Set wallpaper for each tag
local wp_random = {
  "wall_10.png",
  "wall_12.png",
  "wall_13.png",
  "wall_14.png",
  "wall_15.png",
  "wall_16.png",
  "wall_17.png",
  "wall_18.png",
  "wall_19.png",
  "wall_20.png",
}

local wp_selected = {
  "random",
  "wall_10.png",
  "wall_12.png",
  "wall_13.png",
  "wall_14.png",
  "wall_15.png",
  "wall_16.png",
  "wall_17.png",
  "wall_18.png",
  "wall_19.png",
  "wall_20.png",
}

-- }}}

-- {{{ Wibar
-- Separators and markups
local separators = lain.util.separators
local markup = lain.util.markup

--------------------------
-- Widgets Declarations
--------------------------
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")

-- fix params for wibox boxes
local wiboxMargin = 3
local underLineSize = 2
local wiboxBox0 = fishlive.widget.wiboxBox0Underline
local wiboxBox1 = fishlive.widget.wiboxBoxIconUnderline
local wiboxBox2 = fishlive.widget.wiboxBox2IconUnderline


-- FS ROOT
wboxColor = theme.baseColors[2]
local fsicon = wibox.widget.textbox()
fsicon:set_markup(markup.fontfg(theme.font_larger, wboxColor, ""))
theme.fs = lain.widget.fs({
  notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.font_notify },
  settings = function()
    local fsp = string.format(" %3.2f %s ", fs_now["/"].used, fs_now["/"].units)
    widget:set_markup(markup.fontfg(theme.font, theme.widgetbar_fg, fsp))
  end,
})
local fsWibox = wiboxBox1(fsicon, theme.fs.widget, wboxColor, theme.widgetbar_fg, 2, 3, underLineSize, wiboxMargin)

-- MEM
wboxColor = theme.baseColors[3]
local memicon = wibox.widget.textbox()
memicon:set_markup(markup.fontfg(theme.font_larger, wboxColor, ""))
local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.fontfg(theme.font, theme.widgetbar_fg, " " .. mem_now.used .. " MB "))
    broker.emit_signal("broker::mem", {
      value = mem_now,
    })
  end,
})
local memWibox = wiboxBox1(memicon, mem.widget, wboxColor, theme.widgetbar_fg, 2, 3, underLineSize, wiboxMargin)

-- CPU
wboxColor = theme.baseColors[4]
local cpuicon = wibox.widget.textbox()
cpuicon:set_markup(markup.fontfg(theme.font_larger, wboxColor, ""))
local cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup.fontfg(theme.font, theme.widgetbar_fg, " " .. cpu_now.usage .. " % "))
    broker.emit_signal("broker::cpu", {
      value = cpu_now,
    })
  end,
})
local cpuWibox = wiboxBox1(cpuicon, cpu.widget, wboxColor, theme.widgetbar_fg, 3, 4, underLineSize, wiboxMargin)

-- CPU and GPU temps (lain, average)
wboxColor = theme.baseColors[5]
local tempicon = wibox.widget.textbox()
tempicon:set_markup(markup.fontfg(theme.font_larger, wboxColor, ""))
local tempcpu = lain.widget.temp_ryzen({
  settings = function()
    widget:set_markup(markup.fontfg(theme.font, theme.widgetbar_fg, " cpu " .. tostring(coretemp_now) .. "˚C"))
    broker.emit_signal("broker::cputemp", {
      value = coretemp_now,
    })
  end,
})
-- local tempgpu = lain.widget.temp_gpu({
--   settings = function()
--     widget:set_markup(markup.fontfg(theme.font, theme.widgetbar_fg, " gpu " .. tostring(coretemp_now) .. "˚C"))
--     broker.emit_signal("broker::gputemp", {
--       value = coretemp_now
--     })
--   end
-- })
-- local tempWibox = wiboxBox2(tempicon, tempcpu.widget, tempgpu.widget, wboxColor, theme.widgetbar_fg, 4, 4, underLineSize, wiboxMargin)
local tempWibox =
    wiboxBox2(tempicon, tempcpu.widget, NULL, wboxColor, theme.widgetbar_fg, 4, 4, underLineSize, wiboxMargin)

-- ALSA volume with Material Design Icons
local alsaColor = theme.baseColors[7]
local volicon = wibox.widget.textbox()
theme.volume = lain.widget.alsa({
  settings = function()
    local icon
    if volume_now.status == "off" then
      icon = "" -- Material icon for muted
    elseif tonumber(volume_now.level) == 0 then
      icon = "" -- Material icon for muted
    elseif tonumber(volume_now.level) <= 25 then
      icon = "" -- Material icon for low volume
    elseif tonumber(volume_now.level) <= 70 then
      icon = "" -- Material icon for medium volume
    else
      icon = "" -- Material icon for high volume
    end
    volicon:set_markup(markup.fontfg(theme.font_larger, alsaColor, icon))
    widget:set_markup(markup.fontfg(theme.font, theme.widgetbar_fg, " " .. volume_now.level .. "% "))
  end,
})

-- Wibox container for volume
local alsaWibox =
    wiboxBox1(volicon, theme.volume.widget, alsaColor, theme.widgetbar_fg, 3, 3, underLineSize, wiboxMargin)

-- Net
wboxColor = theme.baseColors[8]
local neticon = wibox.widget.textbox()
neticon:set_markup(markup.fontfg(theme.font_larger, wboxColor, "󰈀"))
local net = lain.widget.net({
  settings = function()
    widget:set_markup(
      markup.fontfg(
        theme.font,
        theme.widgetbar_fg,
        string.format("%#7.1f", net_now.sent)
        .. " 󰜷 "
        .. string.format("%#7.1f", net_now.received)
        .. " 󰜮 "
      )
    )
    broker.emit_signal("broker::net", {
      value = net_now,
    })
  end,
})
local netWibox = wiboxBox1(neticon, net.widget, wboxColor, theme.widgetbar_fg, 3, 3, underLineSize, wiboxMargin)

-- Textclock widget
wboxColor = theme.baseColors[9]
local clockicon = wibox.widget.textbox()
clockicon:set_markup(markup.fontfg(theme.font_larger, wboxColor, "󱛡"))
local mytextclock = wibox.widget.textclock(markup.fontfg(theme.font_medium, theme.clock_fg, " %I:%M %p "), 1)
local clockWibox = wiboxBox1(clockicon, mytextclock, wboxColor, theme.widgetbar_fg, 0, 0, underLineSize, wiboxMargin)

-- power widget
wboxColor = theme.baseColors[3]
local powIcon = wibox.widget.textbox()
local powWibox = wiboxBox1(
  nil,
  battery_widget({ display_notification = true, show_current_level = true, margin_right = 1 }),
  wboxColor,
  theme.widgetbar_fg,
  0,
  0,
  underLineSize,
  wiboxMargin
)

-- brightness widget
wboxColor = theme.baseColors[2]
local brightWibox = wiboxBox1(
  nil,
  brightness_widget({
    type = "arc",
    program = "brightnessctl",
    step = 2,
  }),
  wboxColor,
  theme.widgetbar_fg,
  0,
  0,
  underLineSize,
  wiboxMargin
)

-- Calendar widget
local cw = calendar_widget({
  theme = "outrun",
  placement = "top_right",
})

-- Systray
local systray = wibox.widget.systray()
systray.base_size = theme.bar_height
-- Separators
local separator = wibox.widget.textbox()

-- {{{ Menu - Press Button Awesome
-- Create a launcher widget and a main menu
local myawesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. capi.awesome.conffile },
  { "restart",     capi.awesome.restart },
  {
    "quit",
    function()
      capi.awesome.quit()
    end,
  },
}

-- Colorscheme Menu
theme.menu_colorschemes_create = function()
  local menu = awful.menu({
    items = colorscheme.menu.prepare_colorscheme_menu(),
    theme = {
      height = dpi(18),
      width = dpi(200),
    },
  })
  fishlive.widget.click_to_hide_menu(menu, nil, true)
  return menu
end

-- Portrait Menu
theme.menu_portrait_create = function()
  local menu = awful.menu({
    items = colorscheme.menu.prepare_portrait_menu(),
    theme = {
      height = dpi(18),
      width = dpi(200),
    },
  })
  fishlive.widget.click_to_hide_menu(menu, nil, true)
  return menu
end

-- Main Launcher Menus --
local menuTheme = fhelpers.copyTable(theme)
menuTheme["font"] = theme.menu_font
menuTheme["height"] = 22
menuTheme["width"] = 350
local mylauncher = awful.widget.launcher({
  image = theme.awesome_icon,
  menu = awful.menu({
    items = {
      { "Awesome",         myawesomemenu,                              theme.awesome_icon },
      { "ColorScheme",     colorscheme.menu.prepare_colorscheme_menu() },
      { "PortraitsScheme", colorscheme.menu.prepare_portrait_menu() },
      { "Open Terminal",   terminal },
    },
    theme = menuTheme,
  }),
})
-- }}}

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-------------------------------------
-- DESKTOP and PANELS CONFIGURATION
-------------------------------------
capi.screen.connect_signal("request::desktop_decoration", function(s)
  local tags = {
    icons = {
      "",
      "",
      "",
      "",
      "懲",
      "",
      "󰈸",
      "󰇧",
      "",
    },
    names = { "/main", "/w3", "/apps", "/dev", "/water", "/air", "/fire", "/earth", "/love" },
    layouts = {
      awful.layout.layouts[13],   --main
      awful.layout.layouts[2],    --www (machi)
      awful.layout.layouts[2],    --apps (machi)
      awful.layout.suit.floating, --idea
      awful.layout.layouts[11],   --water (machi to empty placement)
      awful.layout.layouts[8],    --air
      awful.layout.layouts[5],    --fire (center-work)
      awful.layout.layouts[6],    --earth (termfair)
      awful.layout.layouts[9],    --love
    },
  }
  local unpack = table.unpack or unpack
  -- Each screen has its own tag table.
  local tagCount = isFullhd and 9 or #tags.names
  for ss = 1, capi.screen.count() do
    tags[ss] = awful.tag({ unpack(tags.names, 1, tagCount) }, ss, { unpack(tags.layouts, 1, tagCount) })
    -- Set additional optional parameters for each tag
    --tags[s][1].column_count = 2
  end

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen with support popup menu with layouts.
  local layoutsmenu = fishlive.widget.layoutsmenu
  s.mylayoutsmenu = layoutsmenu(s)

  -- TAGLIST COMPONENT
  -- Taglist Callbacks
  local update_tag = function(self, c3, index, objects)
    local focused = false
    for _, x in pairs(awful.screen.focused().selected_tags) do
      if x.index == index then
        focused = true
        break
      end
    end
    local color
    if focused then
      color = theme.bg_underline
    else
      color = theme.bg_normal
    end
    local tagBox = self:get_children_by_id("overline")[1]
    local iconBox = self:get_children_by_id("icon_text_role")[1]
    iconBox:set_markup(markup.fontfg(theme.font_larger, theme.baseColors[index], tags.icons[index]))
    tagBox.bg = color
  end

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ modkey }, 1, function(t)
        if capi.client.focus then
          capi.client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
        if capi.client.focus then
          capi.client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
    widget_template = {
      {
        {
          layout = wibox.layout.fixed.vertical,
          {
            layout = wibox.layout.fixed.horizontal,
            {
              {
                id = "icon_text_role",
                widget = wibox.widget.textbox,
              },
              left = 7,
              right = 0,
              top = 0,
              bottom = -2,
              widget = wibox.container.margin,
            },
            {
              {
                id = "text_role",
                widget = wibox.widget.textbox,
              },
              top = 0,
              right = 7,
              bottom = -2,
              widget = wibox.container.margin,
            },
          },
          {
            {
              top = 0,
              bottom = 3,
              widget = wibox.container.margin,
            },
            id = "overline",
            bg = theme.bg_normal,
            shape = gears.shape.rectangle,
            widget = wibox.container.background,
          },
        },
        widget = wibox.container.margin,
      },
      id = "background_role",
      bg = theme.bg_normal,
      fg = theme.fg_normal,
      widget = wibox.container.background,
      shape = gears.shape.rectangle,
      create_callback = update_tag,
      update_callback = update_tag,
    },
  })

  -- TASKLIST
  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({}, 1, function(c)
        c:activate({ context = "tasklist", action = "toggle_minimization" })
      end),
      awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
      end),
      awful.button({}, 4, function()
        awful.client.focus.byidx(-1)
      end),
      awful.button({}, 5, function()
        awful.client.focus.byidx(1)
      end),
    },
  })

  -- bind calendar with clock widget
  mytextclock:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
      cw.toggle()
    end
  end)

  -- separator type
  separator:set_text("   ")

  -- drop some widgets for small resolutions
  -- if isFullhd then
  -- tempWibox, netWibox, weatherWibox = nil, nil, nil
  -- end

  -------------------------------
  -- MAIN PANEL CONFIGURATION
  -------------------------------
  -- Create the wibox
  if config.main_panel == "polybar" then
    -- Polybar support
    awful.util.spawn(os.getenv("HOME") .. "/.config/polybar/launch.sh")
    s.mywibox = awful.wibar({ position = "top", height = 25, screen = s })
  elseif config.main_panel == "none" then --nothing to do
  else
    -- Add widgets to the wibox
    --awful.util.spawn("killall -q polybar")
    s.mywibox = awful.wibar({ position = "top", bg = theme.bg_normal, screen = s, height = 20 })
    s.bottomwibox = awful.wibar({ position = "bottom", bg = theme.bg_normal, screen = s, height = 20 })

    s.mywibox.widget = {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        separator,
        s.mytaglist,
        separator,
        s.mypromptbox,
      },
      -- s.mytasklist, -- Middle widget,
      nil,
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        separator,
        netWibox,
        brightWibox,
        fsWibox,
        memWibox,
        cpuWibox,
        tempWibox,
        alsaWibox,
        clockWibox,
        s.mylayoutsmenu,
      },
    }

    s.bottomwibox.widget = {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        separator,
      },
      s.mytasklist, -- Middle widget
      {             -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        battery_widget({ display_notification = true, show_current_level = true, margin_right = 0 }),
        systray,
      },
    }
  end

  --------------------------
  -- ACTIVE CORNERS
  --------------------------
  if config.active_corners_enabled then
    active_corners.init(s, {
      -- bottom_right corner
      br = function()
        capi.awesome.emit_signal("dashboard::toggle")
      end,
    })
  end

  --------------------------
  -- DESKTOP ICONS
  --------------------------
  -- Desktop
  if config.desktop_enabled then
    require("fishlive.widget.desktop").add_icons({ screen = s })
  end

  --------------------------
  -- NAUGHTY CONFIGURATION
  --------------------------
  naughty.config.defaults.ontop = true
  naughty.config.defaults.icon_size = dpi(360)
  naughty.config.defaults.timeout = 10
  naughty.config.defaults.hover_timeout = 300
  naughty.config.defaults.title = "System Notification Title"
  naughty.config.defaults.margin = dpi(16)
  naughty.config.defaults.border_width = 0
  naughty.config.defaults.position = "top_middle"
  naughty.config.defaults.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(6))
  end

  -- Apply theme variables
  naughty.config.padding = dpi(8)
  naughty.config.spacing = dpi(8)
  naughty.config.icon_dirs = {
    "/usr/share/icons/Papirus-Dark/",
    "/usr/share/icons/Tela",
    "/usr/share/icons/Tela-blue-dark",
    "/usr/share/icons/la-capitaine/",
  }
  naughty.config.icon_formats = { "svg", "png", "jpg", "gif" }

  rnotification.connect_signal("request::rules", function()
    -- Critical notifs
    rnotification.append_rule({
      rule = { urgency = "critical" },
      properties = {
        font = theme.font_notify,
        bg = theme.bg_urgent,
        fg = theme.fg_normal,
        margin = dpi(16),
        icon_size = dpi(360),
        position = "top_middle",
        implicit_timeout = 0,
      },
    })

    -- Normal notifs
    rnotification.append_rule({
      rule = { urgency = "normal" },
      properties = {
        font = theme.font_notify,
        bg = theme.notification_bg,
        fg = theme.notification_fg,
        margin = dpi(16),
        position = "top_middle",
        implicit_timeout = 10,
        icon_size = dpi(360),
        opacity = 0.87,
      },
    })

    -- Low notifs
    rnotification.append_rule({
      rule = { urgency = "low" },
      properties = {
        font = theme.font_notify,
        bg = theme.notification_bg,
        fg = theme.notification_fg,
        margin = dpi(16),
        position = "top_middle",
        implicit_timeout = 10,
        icon_size = dpi(360),
        opacity = 0.87,
      },
    })
  end)

  -- Error handling
  naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification({
      urgency = "critical",
      title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
      message = message,
      app_name = "System Notification",
      icon = theme.awesome_icon,
    })
  end)
  -- naughty.connect_signal("request::display", function(n)
  --     naughty.layout.box { notification = n }
  -- end
  -- )

  -- XDG icon lookup
  naughty.connect_signal("request::icon", function(n, context, hints)
    if context ~= "app_icon" then
      -- try use random notification portrait from resources
      if #notif_user >= 1 then
        n.icon = notifpath_user .. notif_user[math.random(#notif_user)]
      end
      return
    end
    -- try use application icon
    local path = menubar.utils.lookup_icon(hints.app_icon) or menubar.utils.lookup_icon(hints.app_icon:lower())

    if path then
      n.icon = path
    end
  end)

  naughty.connect_signal("request::action_icon", function(a, _, hints)
    a.icon = menubar.utils.lookup_icon(hints.id)
  end)

  -----------------------------------------------
  -- WALLPAPER PER TAG and USER WALLS keybinding
  -----------------------------------------------
  -- Try to load notification icons
  notif_user = fhelpers.scandirArgs({ dir = notifpath_user, fileExt = "*.{png,jpg}" })

  -- User Wallpaper Changer
  local wp_user_params = {
    screen = capi.screen,
    wppath_user = wppath_user,
  }
  theme.change_wallpaper_user = fishlive.wallpaper.createUserWallpaper(wp_user_params)

  -- Colorscheme Wallpaper Changer
  local wp_colorscheme_params = {
    screen = capi.screen,
    wppath_user = wppath_colorscheme,
  }
  theme.change_wallpaper_colorscheme = fishlive.wallpaper.createUserWallpaper(wp_colorscheme_params)

  -- Register Tag Wallpaper Changer
  fishlive.wallpaper.registerTagWallpaper({
    screen = capi.screen,
    wp_selected = wp_selected,
    wp_random = wp_random,
    wppath = wppath,
    wp_user_params = wp_user_params,
    wp_colorscheme_params = wp_colorscheme_params,
    change_wallpaper_colorscheme = theme.change_wallpaper_colorscheme,
  })

  ---------------------------
  -- Collage Images Feature
  ---------------------------
  local collageTag = function(wppath, wps, tagids, collage_template)
    local imgsources = {}
    for i = 1, #wps do
      imgsources[i] = wppath .. wps[i]
    end
    fhelpers.shuffle(imgsources)
    collage.registerTagCollage({
      screen = capi.screen,
      collage_template = collage_template,
      imgsources = imgsources,
      tagids = tagids,
    })
  end
  -- Portraits Collage for Dev Tag
  local wppath_sel_portrait = notifpath .. sel_portrait .. "/"
  local portraits = fhelpers.getImgsFromDir(notifpath, sel_portrait)
  if isFullhd then
    collageTag(wppath_sel_portrait, portraits, { 4 }, {
      { max_height = 450, posx = 10, posy = 40 },
      { max_height = 450, posx = 10, posy = 500 },
    })
  else
    collageTag(wppath_sel_portrait, portraits, { 4 }, {
      { max_height = 600, posx = 100,  posy = 100 },
      { max_height = 600, posx = 100,  posy = 800 },
      { max_width = 600,  posx = 3740, posy = 2060, align = "bottom-right" },
    })
  end
  -- Joy Collage for love Tag
  collageTag(wppath_sel_portrait, portraits, { 9 }, {
    { max_height = 800, posx = 100,  posy = 100 },
    { max_height = 400, posx = 100,  posy = 930 },
    { max_height = 400, posx = 450,  posy = 930 },
    { max_height = 400, posx = 870,  posy = 100 },
    { max_height = 400, posx = 1220, posy = 100 },
    { max_height = 800, posx = 870,  posy = 530 },
    { max_height = 760, posx = 100,  posy = 1370 },
    { max_height = 400, posx = 870,  posy = 1370 },
    { max_height = 400, posx = 1220, posy = 1370 },
  })
  -- Collage of user wallpapers
  -- collageTag(wppath_user, fhelpers.scandir(wppath_user), {3}, {
  --   { max_width = 800, posx = 100, posy = 100 },
  --   { max_width = 1200, posx = 100, posy = 800 },
  --   { max_width = 800, posx = 3740, posy = 1700, align = "bottom-right" },
  -- })
  -- }}}
end)
-- }}}

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
