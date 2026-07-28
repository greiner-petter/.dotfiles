local vars = require("variables")

-- Monitor config
hl.monitor({
    output   = "",
    mode     = "2560x1440@240",
    position = "auto",
    scale    = 1,
})

-- Hyprland config
hl.config({
    input = {
        kb_layout = "eu",
        kb_options = "caps:escape,altwin:swap_lalt_lwin",

        force_no_accel = true,

        scroll_method = "on_button_down",
        scroll_button = 274,

        float_switch_override_focus = 2,
    },
    misc = {
        vrr = 3
    }
})

-- Window rules
hl.window_rule({ match = { class = "xarchiver" }, tag = "+float" })
hl.window_rule({ match = { class = "com.anthropic.Claude" }, workspace = "special:claude" })
hl.window_rule({ match = { class = "mpv" }, tag = "+float", size  = "(monitor_w*0.75) (monitor_h*0.75)",})

-- Shell keybinds
hl.unbind("SUPER + SUPER_L")
hl.bind("SUPER + Space", hl.dsp.global("caelestia:launcher"))

hl.unbind("SUPER + ALT + S")
hl.bind("SUPER + ALT + S", hl.dsp.global("caelestia:screenshotFreeze"))

hl.unbind("SUPER + SHIFT + S")
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:special" }))

hl.bind("SUPER + Return", hl.dsp.exec_cmd(vars.terminal))

hl.bind("SUPER + C", hl.dsp.exec_cmd("caelestia toggle claude"))

-- Environment variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("MOZ_DISABLE_RDD_SANDBOX", 1)
