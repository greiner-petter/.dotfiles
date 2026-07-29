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
hl.window_rule({ match = { class = "xarchiver|mpv" }, tag = "+float" })

-- Custom workspace
hl.bind("SUPER + C", hl.dsp.exec_cmd("caelestia toggle claude"))
hl.window_rule({ match = { class = "com.anthropic.Claude" }, workspace = "special:claude" })

-- Environment variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("MOZ_DISABLE_RDD_SANDBOX", 1)
