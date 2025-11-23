#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
BOCIEX_OVERRIDES='source = ~/.config/hypr/bociex.conf'

# Check if the line exists (exact match)
if ! grep -Fxq "$BOCIEX_OVERRIDES" "$CONFIG_FILE"; then
    echo "$BOCIEX_OVERRIDES" >> "$CONFIG_FILE"
    echo "Line added."
else
    echo "Line already present."
fi
