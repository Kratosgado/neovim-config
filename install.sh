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

symlink_with_backup() {
  local src="$1" dst="$2" backup="${2}.pre-nvim-config" resolved_src
  if [[ ! -e "$src" ]]; then
    warn "Source not found, skipping: $src"
    return
  fi
  resolved_src="$(readlink -f "$src")"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" || -L "$dst" ]]; then
    if [[ "$(readlink -f "$dst" 2>/dev/null || true)" == "$resolved_src" ]]; then
      echo "Already linked $dst -> $src"
      return
    fi
    if [[ ! -e "$backup" && ! -L "$backup" ]]; then
      cp -a "$dst" "$backup"
      echo "Backed up $dst -> $backup"
    fi
    rm -rf "$dst"
  fi
  ln -sfn "$src" "$dst"
  echo "Linked $src -> $dst"
}

# 1. Setup Neovim config
mkdir -p "$NVIM_DIR"
cp -rf "$SCRIPT_DIR/." "$NVIM_DIR"

# 2. Zsh
symlink "$NVIM_DIR/zshrc" "$HOME/.zshrc"

# 3. Bash
symlink_with_backup "$NVIM_DIR/bashrc" "$HOME/.bashrc"

# 4. Kitty
symlink "$NVIM_DIR/kitty" "$HOME/.config/kitty"

# 5. Claude
symlink "$NVIM_DIR/claude" "$HOME/.claude"

# 6. Tmux
symlink "$NVIM_DIR/tmux" "$HOME/.config/tmux"

# 7. Lazygit
symlink "$NVIM_DIR/lazygit.yml" "$HOME/.config/lazygit/config.yml"

# 8. Mise
symlink_with_backup "$NVIM_DIR/mise" "$HOME/.config/mise"

# 9. Hyprland user configuration
symlink_with_backup "$NVIM_DIR/hypr" "$HOME/.config/hypr"

# 10. Omarchy user configuration
symlink_with_backup "$NVIM_DIR/omarchy" "$HOME/.config/omarchy"

# 11. Foot
symlink_with_backup "$NVIM_DIR/foot" "$HOME/.config/foot"

echo "Setup complete! Restart your terminal or run 'source ~/.bashrc' (Bash) or 'source ~/.zshrc' (Zsh)."
