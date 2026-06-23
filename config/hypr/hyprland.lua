local colors = require("colors")

hl.config({
	input = {
		repeat_delay = 250,
		repeat_rate = 30,
	},
	general = {
		gaps_in = 4,
		gaps_out = 24,
		border_size = 0,
	},
	decoration = {
		blur = {
			enabled = true,
			passes = 2,
			size = 2,
		},
		shadow = {
			enabled = true,
			range = 6,
			render_power = 4,
			color = colors.foreground,
			color_inactive = colors.foreground,
		},
	},
	cursor = { inactive_timeout = 1 },
	animations = { enabled = true },
})

hl.animation({ leaf = "workspaces", enabled = true, speed = 2, curve = "default", style = "slidevert" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, curve = "default", style = "slide" })
hl.animation({ leaf = "global", enabled = true, speed = 2, curve = "default" })

hl.layer_rule({ match = { namespace = "rofi" }, blur = true, no_anim = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

hl.monitor({ output = "", mode = "preferred", position = "auto", mirror = "eDP-1", scale = 1 })

hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dunst")
end)

hl.bind("SUPER + W", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("rofi-wallpaper"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("rofi-emoji"))
hl.bind("SUPER + Q", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())

hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

hl.bind("CONTROL + Print", hl.dsp.exec_cmd("grimblast --notify copysave screen"), { locked = true })
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast --notify copysave active"), { locked = true })
hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify copysave area"), { locked = true })

hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

local xf_opts = { locked = true, repeating = true }

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), xf_opts)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), xf_opts)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), xf_opts)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), xf_opts)

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 2%-"), xf_opts)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 2%+"), xf_opts)

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), xf_opts)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), xf_opts)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), xf_opts)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), xf_opts)
