#!/bin/bash
set -euo pipefail

REPO_URL="git@github.com:michaldziurowski/dotfiles.git"
DEST_DIR="$HOME/devel/dotfiles"

# Targets in your HOME
NVIM_HOME="$HOME/.config/nvim"
HYPR_HOME_DIR="$HOME/.config/hypr"
HYPR_BINDINGS_FILE="$HYPR_HOME_DIR/bindings.conf"
HYPR_MONITORS_FILE="$HYPR_HOME_DIR/monitors.conf"
HYPR_INPUT_FILE="$HYPR_HOME_DIR/input.conf"
ALACRITTY_FILE="$HOME/.config/alacritty/alacritty.toml"
STARSHIP_FILE="$HOME/.config/starship.toml"
DIRENV_HOME="$HOME/.config/direnv"

echo "==> Cloning to $DEST_DIR ..."
if [ -d "$DEST_DIR/.git" ]; then
	echo "    Repo already exists at $DEST_DIR, pulling latest changes..."
	git -C "$DEST_DIR" pull
else
	mkdir -p "$(dirname "$DEST_DIR")"
	git clone "$REPO_URL" "$DEST_DIR"
fi

# Create symlink for ~/.config/nvim -> ~/.config/dotfiles/.config/nvim
echo "==> Replacing $NVIM_HOME with symlink to repo ..."
ln -sfn "$DEST_DIR/config/nvim" "$NVIM_HOME"

# Ensure ~/.config/hypr exists
mkdir -p "$HYPR_HOME_DIR"

# Replace ~/.config/hypr/bindings.conf with symlink to repo file
echo "==> Replacing $HYPR_BINDINGS_FILE with symlink to repo file ..."
ln -sfn "$DEST_DIR/config/hypr/bindings.conf" "$HYPR_BINDINGS_FILE"

# Replace ~/.config/hypr/monitor.conf with symlink to repo file
echo "==> Replacing $HYPR_MONITORS_FILE with symlink to repo file ..."
ln -sfn "$DEST_DIR/config/hypr/monitors.conf" "$HYPR_MONITORS_FILE"

# Replace ~/.config/hypr/input.conf with symlink to repo file
echo "==> Replacing $HYPR_INPUT_FILE with symlink to repo file ..."
ln -sfn "$DEST_DIR/config/hypr/input.conf" "$HYPR_INPUT_FILE"

# Replace ~/.config/alacritty/alacritty.toml with symlink to repo file
echo "==> Replacing $ALACRITTY_FILE with symlink to repo file ..."
ln -sfn "$DEST_DIR/config/alacritty/alacritty.toml" "$ALACRITTY_FILE"

# Replace ~/.config/starsihp.toml with symlink to repo file
echo "==> Replacing $STARSHIP_FILE with symlink to repo file ..."
ln -sfn "$DEST_DIR/config/starship.toml" "$STARSHIP_FILE"

# Replace ~/.config/direnv/direnv.toml with symlink to repo file
echo "==> Replacing $DIRENV_HOME with symlink to repo file ..."
ln -sfn "$DEST_DIR/config/direnv" "$DIRENV_HOME"

echo "✅ Done!"
echo "   - $NVIM_HOME -> $DEST_DIR/config/nvim"
echo "   - $HYPR_BINDINGS_FILE -> $DEST_DIR/config/hypr/bindings.conf"
echo "   - $HYPR_MONITORS_FILE -> $DEST_DIR/config/hypr/monitors.conf"
echo "   - $HYPR_INPUT_FILE -> $DEST_DIR/config/hypr/input.conf"
echo "   - $ALACRITTY_FILE -> $DEST_DIR/config/alacritty/alacritty.toml"
echo "   - $STARSHIP_FILE -> $DEST_DIR/config/starship.toml"
