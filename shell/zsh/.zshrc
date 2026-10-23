#!/usr/bin/env zsh
# Uncomment for debug with `zprof`
# zmodload zsh/zprof

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
setopt +o nomatch
# setopt autopushd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Start Zim
source "$ZIM_HOME/init.zsh"

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source "$DOTFILES_PATH/shell/init.sh"

fpath=("$DOTFILES_PATH/shell/zsh/themes" "$DOTFILES_PATH/shell/zsh/completions" "$DOTLY_PATH/shell/zsh/themes" "$DOTLY_PATH/shell/zsh/completions" $fpath)

autoload -Uz promptinit && promptinit
prompt ${DOTLY_THEME:-codely}

source "$DOTLY_PATH/shell/zsh/bindings/dot.zsh"
source "$DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh"
source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"

# ------------------------------------------------------------------------------
# Lazy-loaded CLI Tools & Version Managers
# ------------------------------------------------------------------------------

# Lazy load goenv
function go gofmt goenv {
	unset -f go gofmt goenv
	eval "$(goenv init -)"
	"$0" "$@"
}

# Lazy load NVM
function nvm node npm npx yarn pnpm {
	unset -f nvm node npm npx yarn pnpm
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	"$0" "$@"
}

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
	source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

function gcloud {
	unset -f gcloud
	if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
		source "$HOME/google-cloud-sdk/completion.zsh.inc"
	fi
	gcloud "$@"
}

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
