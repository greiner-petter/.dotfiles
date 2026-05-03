source /usr/share/cachyos-fish-config/cachyos-config.fish

# Custom colours
cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

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

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
