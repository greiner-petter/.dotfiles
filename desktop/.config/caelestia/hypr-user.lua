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
        vrr = 2,
        disable_xdg_env_checks = true,
    }
})

-- Middle mouse scrolling: on by default, regular middle mouse while Super is held.
hl.on("input.keyboard.key", function(keycode, _, pressed)
    if keycode == 64 or keycode == 134 then
        hl.config({ input = { scroll_method = pressed == 1 and "no_scroll" or "on_button_down" } })
    end
end)

-- Window rules
hl.window_rule({ match = { class = "xarchiver|mpv" }, tag = "+float" })

-- Claude workspace
hl.bind("SUPER + C", hl.dsp.exec_cmd("caelestia toggle claude"))
hl.window_rule({ match = { class = "com.anthropic.Claude" }, workspace = "special:claude" })

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("librepods --start-minimized")
end)

-- Environment variables
hl.env("MOZ_DISABLE_RDD_SANDBOX", 1)
hl.env("DXVK_NVAPI_DRS_SETTINGS", "ngx_dlss_sr_override=on,ngx_dlss_sr_override_render_preset_selection=render_preset_m")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland:GNOME")
