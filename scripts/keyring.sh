#!/bin/bash

sudo pacman -S --noconfirm --needed seahorse #GUI for keys management
systemctl --user enable gcr-ssh-agent.socket
systemctl --user start gcr-ssh-agent.socket
