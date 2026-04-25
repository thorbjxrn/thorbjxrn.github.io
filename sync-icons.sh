#!/usr/bin/env zsh
# Copies app icons from local project repos and resizes to 256x256 for web

SCRIPT_DIR="${0:a:h}"
CODE_DIR="$HOME/Code"
ICONS_DIR="$SCRIPT_DIR/icons"

mkdir -p "$ICONS_DIR"

typeset -A ICONS
ICONS=(
    overdubber "overdubber/overdubber/Assets.xcassets/AppIcon.appiconset/AppIcon.png"
    prana "breathwork/breathwork/Assets.xcassets/AppIcon.appiconset/appicon.png"
    stronq "Stronq/Stronq/Assets.xcassets/AppIcon.appiconset/icon_1024.png"
    habits "Simple-Habit-Tracker/SimpleHabitTracker/Assets.xcassets/AppIcon.appiconset/AppIcon.png"
)

for name in ${(k)ICONS}; do
    src="$CODE_DIR/${ICONS[$name]}"
    dest="$ICONS_DIR/$name.png"

    if [ ! -f "$src" ]; then
        echo "WARNING: $src not found, skipping $name"
        continue
    fi

    cp "$src" "$dest"
    sips -z 256 256 "$dest" --out "$dest" >/dev/null 2>&1
    echo "Synced $name (256x256)"
done

echo "Done. Icons in $ICONS_DIR/"
