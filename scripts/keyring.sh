#!/bin/bash

sudo pacman -S seahorse #GUI for keys management
systemctl --user enable gcr-ssh-agent.socket
systemctl --user start gcr-ssh-agent.socket
