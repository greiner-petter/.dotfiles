#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/minimalistic-wallpaper-collection/images"
#I dont know what the fuck I am doing
menu() {
  find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}
main() {
  choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
  if [[ -z "$choice" ]]; then
    exit 0
  fi

  selected_wallpaper=$(echo "$choice" | sed 's/^img://')
  swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
  wal -i "$selected_wallpaper" -n --cols16
  swaync-client --reload-css
  cat ~/.cache/wal/colors-kitty.conf >~/.config/kitty/current-theme.conf
  if command -v pywalfox &> /dev/null; then
    pywalfox update
  fi
  source ~/.cache/wal/colors.sh
  cava_config="$HOME/.config/cava/config"
  if [[ -f "$cava_config" ]]; then
    sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
    sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config
    pkill -USR2 cava 2>/dev/null
  fi
  source ~/.cache/wal/colors.sh && cp "$selected_wallpaper" ~/wallpapers/pywallpaper.jpg
}
main
