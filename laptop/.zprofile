eval "$(/opt/homebrew/bin/brew shellenv)"

fastfetch

export PATH="/opt/homebrew/opt/llvm/bin:$PATH" 
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export DISPLAY=0

alias ls='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../../'
alias finder='open -a Finder'
