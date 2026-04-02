#!/bin/bash

set -e

DOTFILES="$HOME/dotfiles"

echo "🔗 Installing symlinks from $DOTFILES..."

link() {
    SRC="$DOTFILES/$1"
    DEST="$2"

    if [ -e "$DEST" ] || [ -L "$DEST" ]; then
        echo "⚠️  Removing existing: $DEST"
        rm -rf "$DEST"
    fi

    echo "➡️  Linking $SRC -> $DEST"
    ln -s "$SRC" "$DEST"
}

# configs
link "niri" "$HOME/.config/niri"
link "alacritty" "$HOME/.config/alacritty"
link "rofi" "$HOME/.config/rofi"
link "waybar" "$HOME/.config/waybar"
link "sunsetr" "$HOME/.config/sunsetr"
link "swaylock" "$HOME/.config/swaylock"

echo "✅ All symlinks installed!"
