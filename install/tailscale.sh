#!/bin/bash

sudo pacman -S --noconfirm --needed tailscale

sudo systemctl enable --now tailscaled

# tray icon
tailscale configure systray --enable-startup=systemd
systemctl --user daemon-reload
systemctl --user enable --now tailscale-systray
