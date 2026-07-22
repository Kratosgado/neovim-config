#!/bin/bash

# 1. Setup Neovim config
mkdir -p ~/.config/nvim
# Sync current directory content to nvim config (excluding the script itself if desired)
cp -rf . ~/.config/nvim

# 2. Setup Zsh Symlink
rm -f ~/.zshrc
ln -s ~/.config/nvim/zshrc ~/.zshrc

# 4. Setup Kitty Symlink
rm -rf ~/.config/kitty
ln -s ~/.config/nvim/kitty ~/.config/

# 5. Setup Claude Symlink
rm -rf ~/.claude
ln -s ~/.config/nvim/claude ~/.claude

echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc'"
