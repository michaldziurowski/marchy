#!/bin/bash

sudo pacman -S --noconfirm --needed stow

echo "Running stow..."

#stow doesnt override files if they already exist so we have to move existing ones
mv ~/.bashrc ~/.bashrc.backup
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.config/ghostty/config ~/.config/ghostty/config.backup
mv ~/.config/starship.toml ~/.config/starship.toml.backup

stow -t ~ configs
