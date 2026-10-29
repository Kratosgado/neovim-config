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
if [[ -L "$HOME/.config/mise" && "$(readlink -f "$HOME/.config/mise")" == "$(readlink -f "$HOME/.config/nvim/mise")" ]]; then
  rm "$HOME/.config/mise"
  echo "Removed $HOME/.config/mise"
  if [[ -e "$HOME/.config/mise.pre-nvim-config" || -L "$HOME/.config/mise.pre-nvim-config" ]]; then
    mv "$HOME/.config/mise.pre-nvim-config" "$HOME/.config/mise"
    echo "Restored $HOME/.config/mise from backup"
  fi
fi
if [[ -L "$HOME/.config/foot" && "$(readlink -f "$HOME/.config/foot")" == "$(readlink -f "$HOME/.config/nvim/foot")" ]]; then
  rm "$HOME/.config/foot"
  echo "Removed $HOME/.config/foot"
  if [[ -e "$HOME/.config/foot.pre-nvim-config" || -L "$HOME/.config/foot.pre-nvim-config" ]]; then
    mv "$HOME/.config/foot.pre-nvim-config" "$HOME/.config/foot"
    echo "Restored $HOME/.config/foot from backup"
  fi
fi
if [[ -L "$HOME/.config/hypr" && "$(readlink -f "$HOME/.config/hypr")" == "$(readlink -f "$HOME/.config/nvim/hypr")" ]]; then
  rm "$HOME/.config/hypr"
  echo "Removed $HOME/.config/hypr"
  if [[ -e "$HOME/.config/hypr.pre-nvim-config" || -L "$HOME/.config/hypr.pre-nvim-config" ]]; then
    mv "$HOME/.config/hypr.pre-nvim-config" "$HOME/.config/hypr"
    echo "Restored $HOME/.config/hypr from backup"
  fi
fi
if [[ -L "$HOME/.config/omarchy" && "$(readlink -f "$HOME/.config/omarchy")" == "$(readlink -f "$HOME/.config/nvim/omarchy")" ]]; then
  rm "$HOME/.config/omarchy"
  echo "Removed $HOME/.config/omarchy"
  if [[ -e "$HOME/.config/omarchy.pre-nvim-config" || -L "$HOME/.config/omarchy.pre-nvim-config" ]]; then
    mv "$HOME/.config/omarchy.pre-nvim-config" "$HOME/.config/omarchy"
    echo "Restored $HOME/.config/omarchy from backup"
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
