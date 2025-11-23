#!/bin/bash

# drivers for samsung m2070w printer

yay -S --noconfirm --needed samsung-unified-driver
sudo systemctl restart cups.service

# after that add printer via printer settings ui (system-config-printer ?)
