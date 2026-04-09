#!/bin/bash

# 1. Setup Neovim config
mkdir -p ~/.config/nvim
# Sync current directory content to nvim config (excluding the script itself if desired)
cp -rf . ~/.config/nvim

# 2. Setup Zsh Symlinks
# Remove existing files/dirs to avoid link conflicts
rm -f ~/.zshrc
rm -rf ~/.oh-my-zsh/custom

# Link the zshrc from the nvim folder to the home directory
ln -s ~/.config/nvim/zshrc ~/.zshrc

# Link the custom plugins/themes folder back to Oh My Zsh
# This assumes you moved your 'custom' folder to 'zsh_custom' inside your nvim repo
ln -s ~/.config/nvim/zsh_custom ~/.oh-my-zsh/custom

echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc'"
