#!/bin/bash
set -euo pipefail

REPO_URL="git@github.com:michaldziurowski/dotfiles.git"
DEST_DIR="$HOME/.config/dotfiles"

# Targets in your HOME
NVIM_HOME="$HOME/.config/nvim"
HYPR_HOME_DIR="$HOME/.config/hypr"
HYPR_BINDINGS_FILE="$HYPR_HOME_DIR/bindings.conf"
HYPR_MONITORS_FILE="$HYPR_HOME_DIR/monitors.conf"
HYPR_INPUT_FILE="$HYPR_HOME_DIR/input.conf"

echo "==> Cloning (no checkout) to $DEST_DIR ..."
if [ -d "$DEST_DIR/.git" ]; then
  echo "    Repo already exists at $DEST_DIR, fetching latest refs..."
  git -C "$DEST_DIR" fetch --all --prune
else
  git clone --no-checkout "$REPO_URL" "$DEST_DIR"
fi

echo "==> Configuring sparse-checkout for .config/nvim and .config/hypr ..."
cd "$DEST_DIR"
git sparse-checkout init --cone
git sparse-checkout set config/nvim config/hypr

git checkout

# Create symlink for ~/.config/nvim -> ~/.config/dotfiles/.config/nvim
echo "==> Replacing $NVIM_HOME with symlink to repo ..."
rm -rf "$NVIM_HOME"
ln -s "$DEST_DIR/config/nvim" "$NVIM_HOME"

# Ensure ~/.config/hypr exists
mkdir -p "$HYPR_HOME_DIR"

# Replace ~/.config/hypr/bindings.conf with symlink to repo file
echo "==> Replacing $HYPR_BINDINGS_FILE with symlink to repo file ..."
rm -f "$HYPR_BINDINGS_FILE"
ln -s "$DEST_DIR/config/hypr/bindings.conf" "$HYPR_BINDINGS_FILE"

# Replace ~/.config/hypr/monitor.conf with symlink to repo file
echo "==> Replacing $HYPR_MONITORS_FILE with symlink to repo file ..."
rm -f "$HYPR_MONITORS_FILE"
ln -s "$DEST_DIR/config/hypr/monitors.conf" "$HYPR_MONITORS_FILE"


# Replace ~/.config/hypr/input.conf with symlink to repo file
echo "==> Replacing $HYPR_INPUT_FILE with symlink to repo file ..."
rm -f "$HYPR_INPUT_FILE"
ln -s "$DEST_DIR/config/hypr/input.conf" "$HYPR_INPUT_FILE"

echo "✅ Done!"
echo "   - $NVIM_HOME -> $DEST_DIR/.config/nvim"
echo "   - $HYPR_BINDINGS_FILE -> $DEST_DIR/config/hypr/bindings.conf"
echo "   - $HYPR_MONITORS_FILE -> $DEST_DIR/config/hypr/monitors.conf"
echo "   - $HYPR_INPUT_FILE -> $DEST_DIR/config/hypr/input.conf"
