source /usr/share/cachyos-fish-config/cachyos-config.fish

# Override fish greeting
function fish_greeting
    fastfetch --key-padding-left 5
end

# Save package lists to dotfiles
function pkg-save
    # Packages in official/CachyOS repos that should be installed from AUR
    set aur_exceptions quickshell-git

    pacman -Qen | awk '{print $1}' | grep -Evx (string join '|' $aur_exceptions) > ~/.dotfiles/packages/pacman.txt
    pacman -Qem | awk '{print $1}' > ~/.dotfiles/packages/aur.txt
    for pkg in $aur_exceptions
        pacman -Qq $pkg &>/dev/null && echo $pkg >> ~/.dotfiles/packages/aur.txt
    end
    echo "Package lists saved to ~/.dotfiles/packages/"
end
