#!/usr/bin/env bash

# The terminal must exist before it can launch T3. Once T3 maps its window,
# put T3 first, refocus the terminal, and then open VS Code to its right.
t3_window_id=""

for _ in {1..120}; do
    t3_window_id="$(niri msg --json windows | jq -r '[.[] | select(.app_id | startswith("t3"))] | first | .id // empty')"
    if [[ -n "$t3_window_id" ]]; then
        break
    fi
    sleep 0.25
done

if [[ -n "$t3_window_id" ]]; then
    niri msg action focus-window --id "$t3_window_id"
    niri msg action move-column-to-first

    terminal_window_id="$(niri msg --json windows | jq -r '[.[] | select(.app_id == "Alacritty" and .title == "T3 Terminal")] | first | .id // empty')"
    if [[ -n "$terminal_window_id" ]]; then
        niri msg action focus-window --id "$terminal_window_id"
    fi
fi

exec code
