# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"
alias la="ls -la"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Git
alias gaa="git add -A"
alias ga="git add"
alias gc='git commit'
alias gsw='git switch'
alias gs="git status"
alias gca="git add --all && git commit --amend --no-edit"
alias gd='git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gp="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'

# Docker
alias doc = "docker-compose"


# Utils
alias k='kill -9'
# alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='xdg-open .'
alias up='dot package update_all'

# Settle
alias ztlup="docker-compose -f settle-ws/zetl-compose/docker-compose.yml up"
alias ztldown="docker-compose -f settle-ws/zetl-compose/docker-compose.yml down"
