#!/usr/bin/env bash

# Pick the newest executable T3 build, so replacing the AppImage does not
# require another Niri config update.
t3_appimage=""

for candidate in /home/lwrs/T3-*; do
    if [[ ! -f "$candidate" || ! -x "$candidate" ]]; then
        continue
    fi

    if [[ -z "$t3_appimage" || "$candidate" -nt "$t3_appimage" ]]; then
        t3_appimage="$candidate"
    fi
done

if [[ -n "$t3_appimage" ]]; then
    cd /home/lwrs || exit 1
    "./${t3_appimage##*/}"
else
    printf 'No executable matching /home/lwrs/T3-* was found.\n'
fi

exec bash
