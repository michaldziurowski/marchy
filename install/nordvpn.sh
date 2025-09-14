#!/bin/bash

yay -S --noconfirm --needed nordvpn-bin
yay -S --noconfirm --needed nordvpn-gui

sudo usermod -aG nordvpn $USER

sudo systemctl enable nordvpnd.service
sudo systemctl start nordvpnd.service
