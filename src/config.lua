local apps = {
	launcher = "rofi -show-icons -modi windowcd,window,drun -show drun -filter ",
	xrandr = "lxrandr",
	screenshot = "flameshot",
	volume = "pavucontrol",
	appearance = "lxappearance",
	browser = "zen-browser",
	fileexplorer = "thunar",
	discord = "vesktop",
	editor = "nvim",
	ide = "nvim",
	settings = "code /home/diego/.config/awesome/",
}

local terminal_cmds = {}

local user = {
	terminal = "kitty",
	terminal2nd = "alakritty",
}

local config = {
	apps = apps,
	user = user,
	terminal_cmds = terminal_cmds,
	dashboard_monitor_storage = { "/", "/home", "/swap", "/root" },
	main_panel = "wibar", -- variants: wibar, polybar, none
	dashboard_enabled = false,
	desktop_enabled = false,
	active_corners_enabled = true,
}

return config
