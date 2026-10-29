# Bash configuration adapted from zshrc.
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
. "$HOME/.cargo/env"
HISTFILE="$HOME/.bash_history"
HISTSIZE=1000
HISTFILESIZE=1000
shopt -s histappend
shopt -s checkwinsize
shopt -s cmdhist

# Use Emacs-style readline key bindings.
set -o emacs

# Enable programmable completion when available.
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi

export ANDROID_HOME="$HOME/Android/Sdk"
export OPENCODE_CONFIG_DIR="$HOME/.config/nvim/opencode/"
export PATH="$HOME/snap/flutter/common/flutter/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export SKIP=conventional-pre-commit
export PATH="$HOME/.caa/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$HOME/.local/bin:$PATH"
export CARGO_TARGET_DIR="$HOME/.cache/cargo"
export PATH="$HOME/.cargo/bin:$PATH"

# Select an editor appropriate to the session.
if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

# podman aliases
alias dup='podman compose up -d'
alias dps='podman ps'
alias dreset='podman compose down -v && podman compose up -d'
alias ddown='podman compose down'
alias ddvol='podman compose down -v'
alias dstop='podman compose stop'
alias dstart='podman compose start'
alias dlogs='podman compose logs -f'

# Maven aliases
alias mvnc='mvn clean compile'
alias mvnv='mvn clean verify'
alias mvnspring='mvn clean spring-boot:run'
alias mvntest='mvn clean test'
alias mvncheckstyle='mvn clean checkstyle:check'

# Gradle aliases
alias gradlec='./gradlew clean'
alias gradled='./gradlew build'
alias gradlet='./gradlew test'
alias gradlebootrun='./gradlew bootRun'
alias gradlerun='./gradlew run'
alias gradlecheck='./gradlew check'
alias gradledgs='./gradlew generateJava'

# Config and navigation aliases
alias bashconfig='nvim ~/.bashrc'
alias editvim='cd "$HOME/.config/nvim/" && nvim .'
alias editfoot='cd "$HOME/.config/foot/" && nvim .'
alias vaults='cd "$HOME/vaults/" && nvim .'

alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias purge='sudo apt purge'
alias autoremove='sudo apt autoremove'
alias autoclean='sudo apt autoclean'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias pn=pnpm
alias px=pnpx
alias v=nvim
alias vi=nvim
alias c=clear
alias gs='git status'
alias gt='git-town'
alias gsw='git-town switch'
alias gtc='git-town continue'
alias gts='git-town sync'
alias gtsa='git-town sync -a'
alias gtbcreate='git-town append'
alias gtb='git-town branch'
alias gitfetch="git fetch --all && for rb in \$(git branch -r | grep -v '\->' | grep -v 'origin/main'); do lb=\$(echo \$rb | sed 's/origin\///'); git branch --track \$lb \$rb 2>/dev/null; done"
alias push='git push'

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# Git Town completion
if command -v git-town >/dev/null 2>&1; then
  eval "$(git-town completions bash)"
fi

# AWS CLI completion
if [[ -x /snap/aws-cli/current/bin/aws_completer ]]; then
  complete -C '/snap/aws-cli/current/bin/aws_completer' aws
fi

# zoxide and fzf
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi
[[ -f "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"

# SDKMAN (keep near the end so its initialization can update PATH).
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[[ -n "$GRADLE_HOME" ]] && export GRADLE_USER_HOME="$GRADLE_HOME"

# OpenCode and Bun
[[ -d "$HOME/.opencode/bin" ]] && export PATH="$HOME/.opencode/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# Start caa if installed and not already running.
if command -v caa >/dev/null 2>&1 && ! pgrep -x caa >/dev/null 2>&1; then
  caa -d
fi

# Load optional CLI completions.
if command -v ng >/dev/null 2>&1; then
  source <(ng completion script 2>/dev/null)
fi
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
export PAGER=cat

# Enable interactive Bash syntax highlighting when ble.sh is installed.
if [[ -r /usr/share/blesh/ble.sh ]]; then
  source /usr/share/blesh/ble.sh
elif [[ -r "$HOME/.local/share/blesh/ble.sh" ]]; then
  source "$HOME/.local/share/blesh/ble.sh"
fi

# Atuin shell history (initialize after ble.sh so Atuin can use its hooks).
[[ -f "$HOME/.atuin/bin/env" ]] && source "$HOME/.atuin/bin/env"
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init bash)"
fi
# MCP auth token source of truth is Local-MCP's .env file.
if [[ -f "$HOME/projects/configs/Local-MCP/.env" ]]; then
  export MCP_AUTH_TOKEN="$(grep -m1 '^MCP_AUTH_TOKEN=' "$HOME/projects/configs/Local-MCP/.env" | cut -d= -f2- | tr -d '\"\')"
fi

[[ -d "$HOME/.shorebird/bin" ]] && export PATH="$HOME/.shorebird/bin:$PATH"

