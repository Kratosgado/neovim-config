# If you come from bash you might have to change your $PATH.
export ZSH_CUSTOM="$HOME/.config/nvim/zsh_custom"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -e

zstyle :compinstall filename "$HOME/.config/nvim/zshrc"
plugins=(git aws docker kubectl fzf nvm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export ANDROID_HOME=$HOME/Android/Sdk
export OPENCODE_CONFIG_DIR=$HOME/.config/nvim/opencode/
export PATH="$HOME/snap/flutter/common/flutter/bin:$PATH"
export SKIP=conventional-pre-commit

export PATH="$HOME/.caa/bin:$PATH"
# Add Android SDK platform tools to PATH
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH="$HOME/.local/bin:$PATH"
export CARGO_TARGET_DIR="$HOME/.cache/cargo"
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# vim aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias editvim="cd ~/.config/nvim/ && nvim ."
alias editkitty="cd ~/.config/kitty/ && nvim ."
alias vaults="cd ~/vaults/ && nvim ."

alias update="sudo apt update && sudo apt upgrade"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias purge="sudo apt purge"
alias autoremove="sudo apt autoremove"
alias autoclean="sudo apt autoclean"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias pn=pnpm
alias px=pnpx
alias v=nvim
alias vi=nvim
alias c=clear
alias gs="git status"
alias gt="git-town"
alias gsw="git-town switch"
alias gtc="git-town continue"
alias gts="git-town sync"
alias gtbcreate="git-town append"
alias gb="git-town branch"

alias go="git checkout"

alias push="git push"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# pnpm
export PNPM_HOME="/home/esslifie/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
source <(git town completions zsh)
# Enable bash-style completion and disable menu completion
autoload -Uz bashcompinit && bashcompinit
autoload -Uz compinit && compinit
compinit

# Tell zsh to use the AWS CLI's official completer
complete -C '/snap/aws-cli/current/bin/aws_completer' aws

eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export GRADLE_USER_HOME=$GRADLE_HOME

# opencode
export PATH=/home/esslifie/.opencode/bin:$PATH

if [ -z "$(pidof caa)" ]; then
  caa -d
fi

# bun completions
[ -s "/home/esslifie/.bun/_bun" ] && source "/home/esslifie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
