#!/bin/bash

# win=$(niri msg focused-window | grep "App ID" | cut -d '"' -f2 | tr '[:upper:]' '[:lower:]')

win=$(niri msg focused-window \
  | grep "App ID" \
  | cut -d '"' -f2 \
  | tr '[:upper:]' '[:lower:]')

# clean up app id → readable name
clean_name=$(echo "$win" \
  | sed 's/app\.//g' \
  | sed 's/org\.//g' \
  | sed 's/com\.//g' \
  | sed 's/_/ /g' \
  | awk -F. '{print $NF}' \
  | sed 's/\b\(.\)/\u\1/g')

case "$win" in
  *alacritty*) icon="⚡ Terminal" ;;
  *firefox*) icon="🌐 Browser" ;;
  *zen*) icon="🌐 Browser" ;;
  code|code-oss) icon="󰨞 VS Code" ;;
  *) 
      icon="🐧 $clean_name";;
esac

echo "$icon"
