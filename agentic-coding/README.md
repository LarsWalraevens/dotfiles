# Agent skills

The nine skills in `skills/` are vendored from
[t3dotgg/tstack](https://github.com/t3dotgg/tstack) at commit
`1085050f3baed1ac724caa4a8166145fb2ac88af`. See `LICENSE.tstack` for the
upstream MIT license. 

- `~/.agents/skills/` for Codex across all projects.
- `~/.claude/skills/` for Claude Code across all projects (or the `skills/`
  folder inside `CLAUDE_CONFIG_DIR`, when set).

The main dotfiles `install-symlinks.sh` also runs this installer. Existing
skills are preserved: conflicting paths cause an error instead of being
overwritten. Re-running the installer is safe.
