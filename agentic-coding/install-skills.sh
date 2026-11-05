#!/usr/bin/env bash
set -euo pipefail

skill_source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/skills"
skill_destinations=("$HOME/.agents/skills" "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills")

# Check every destination before changing anything. Never replace existing skills.
for skill_path in "$skill_source_dir"/*; do
    [[ -f "$skill_path/SKILL.md" ]] || continue
    for skill_destination in "${skill_destinations[@]}"; do
        skill_link="$skill_destination/$(basename -- "$skill_path")"
        if [[ -e "$skill_link" || -L "$skill_link" ]]; then
            if [[ ! -L "$skill_link" || "$(readlink -f -- "$skill_link")" != "$skill_path" ]]; then
                printf 'Refusing to replace existing skill: %s\n' "$skill_link" >&2
                exit 1
            fi
        fi
    done
done

for skill_destination in "${skill_destinations[@]}"; do
    mkdir -p -- "$skill_destination"
    for skill_path in "$skill_source_dir"/*; do
        [[ -f "$skill_path/SKILL.md" ]] || continue
        skill_link="$skill_destination/$(basename -- "$skill_path")"
        if [[ ! -L "$skill_link" ]]; then
            ln -s -- "$skill_path" "$skill_link"
        fi
        printf 'Skill linked: %s\n' "$skill_link"
    done
done
