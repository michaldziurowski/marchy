#!/bin/bash

mkdir -p ~/devel

sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed nodejs-lts-jod
sudo pacman -S --noconfirm --needed npm

curl -fsSL https://claude.ai/install.sh | bash
