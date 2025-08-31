#!/usr/bin/env bash
set -e

# Target ~/.config
TARGET="$HOME/.config"

# List of "packages" (subfolders of ~/dotfiles)
PACKAGES=(i3 i3status nvim picom tmux)

for pkg in "${PACKAGES[@]}"; do
    echo "Stowing $pkg -> $TARGET"
    stow "$pkg" -t ~
done
