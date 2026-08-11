return {
    ------------------
    ---- HYPRLAND ----
    ------------------

    -- Apps
    editor                  = "zeditor",
    fileExplorer            = "pcmanfm-qt",

    -- Gaps
    workspaceGaps           = 10,
    singleWindowGapsOut     = 10,

    -- Window styling
    windowBorderSize        = 3,

    -- Misc
    volumeStep              = 5,
    cursorTheme             = "WhiteSur-cursors",

    ------------------
    ---- KEYBINDS ----
    ------------------

    -- Workspaces
    kbMoveWinToWs           = "SUPER + SHIFT",
    kbMoveWinToWsGroup      = "CTRL + SUPER + SHIFT",
    kbMoveWinToWsSpecial    = "SUPER + SHIFT + S",

    -- Window Action
    kbToggleWindowFloating  = "SUPER + SHIFT + F",

    -- Apps
    kbTerminal              = { "SUPER + T", "SUPER + Return" },
    kbBrowser               = "SUPER + B",
    kbEditor                = "SUPER + E",
    kbFileExplorer          = "SUPER + N",

    -- Utilities
    kbScreenshotFreeze      = "SUPER + ALT + S",

    -- Misc
    kbLauncher              = "SUPER + Space",
    kbSession               = "SUPER + SHIFT + Escape",
    kbShowSidebar           = "SUPER + A",
}
