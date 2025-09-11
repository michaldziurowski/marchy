#!/bin/bash

sudo pacman -S seahorse #GUI for keys management
systemctl --user enable gcr-ssh-agent.socket
systemctl --user start gcr-ssh-agent.socket
echo 'export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"' >>~/.bashrc # or ~/.zshrc
