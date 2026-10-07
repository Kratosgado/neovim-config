#!/bin/bash

set -euo pipefail

NVIM_DIR="$HOME/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

warn() { echo "WARNING: $*" >&2; }

symlink() {
  local src="$1" dst="$2"
  if [[ ! -e "$src" ]]; then
    warn "Source not found, skipping: $src"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "Linked $src -> $dst"
}

# 1. Setup Neovim config
mkdir -p "$NVIM_DIR"
cp -rf "$SCRIPT_DIR/." "$NVIM_DIR"

# 2. Zsh
symlink "$NVIM_DIR/zshrc" "$HOME/.zshrc"

# 3. Kitty
symlink "$NVIM_DIR/kitty" "$HOME/.config/kitty"

# 4. Claude
symlink "$NVIM_DIR/claude" "$HOME/.claude"

# 5. Tmux
symlink "$NVIM_DIR/tmux" "$HOME/.config/tmux"

# 6. Lazygit
symlink "$NVIM_DIR/lazygit.yml" "$HOME/.config/lazygit/config.yml"

echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc'"
