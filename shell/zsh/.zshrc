#!/usr/bin/env zsh
# Uncomment for debuf with `zprof`
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

export NVM_DIR="$HOME/.nvm"
# Lazy load NVM
function nvm node npm npx yarn pnpm {
	unset -f nvm node npm npx yarn pnpm
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	"$0" "$@"
}

# pnpm
# export PNPM_HOME="/Users/mstefanutti/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mstefanutti/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mstefanutti/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud (Lazy Loaded).
function gcloud {
	unset -f gcloud
	if [ -f '/Users/mstefanutti/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mstefanutti/google-cloud-sdk/completion.zsh.inc'; fi
	gcloud "$@"
}


# Added by Antigravity CLI installer
export PATH="/Users/mstefanutti/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/mstefanutti/.antigravity-ide/antigravity-ide/bin:$PATH"
export PATH="/Users/mstefanutti/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/mstefanutti/.antigravity-ide/antigravity-ide/bin:$PATH"
