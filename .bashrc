

# Load rbenv
eval "$(rbenv init -)"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Use PHP 7.1 on command line
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="$HOME/.node_modules_global/bin:$PATH"

# GENERAL

# Alias to update and upgrade all homebrew packages
alias brewup='brew update && brew upgrade && brew cleanup && brew cask cleanup'

alias ls='ls -GFh'

# alias to launch tmux into 256 color mode by default
alias tmux='tmux -2'

# Colorize 'ls' output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Highlight matches in grep
export GREP_OPTIONS='--color=auto'

export TERM="xterm-256color"

# Bold grayscale prompt
 export PS1="\[\033[;1m\]\u\[\033[m\] @ \[\033[;1m\]\h \[\033[;1m\]\w\[\033[m\] > "

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
