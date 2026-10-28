#!/bin/bash

set -euo pipefail

remove() {
  local path="$1"
  if [[ -e "$path" || -L "$path" ]]; then
    rm -rf "$path"
    echo "Removed $path"
  fi
}

# Symlinks created by install.sh
remove "$HOME/.zshrc"
if [[ -L "$HOME/.bashrc" && "$(readlink -f "$HOME/.bashrc")" == "$(readlink -f "$HOME/.config/nvim/bashrc")" ]]; then
  rm "$HOME/.bashrc"
  echo "Removed $HOME/.bashrc"
  if [[ -e "$HOME/.bashrc.pre-nvim-config" || -L "$HOME/.bashrc.pre-nvim-config" ]]; then
    mv "$HOME/.bashrc.pre-nvim-config" "$HOME/.bashrc"
    echo "Restored $HOME/.bashrc from backup"
  fi
fi
remove "$HOME/.config/kitty"
remove "$HOME/.claude"
remove "$HOME/.config/tmux"
remove "$HOME/.config/lazygit/config.yml"

# Neovim config and runtime data
remove "$HOME/.config/nvim"
remove "$HOME/.local/share/nvim"
remove "$HOME/.local/state/nvim"
remove "$HOME/.cache/nvim"

echo "Uninstall complete."
