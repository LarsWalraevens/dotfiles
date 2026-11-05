# Agent skills

The nine skills in `skills/` are vendored from
[t3dotgg/tstack](https://github.com/t3dotgg/tstack) at commit
`1085050f3baed1ac724caa4a8166145fb2ac88af`. See `LICENSE.tstack` for the
upstream MIT license. Skill contents are unchanged.

Run `bash ~/dotfiles/agentic-coding/install-skills.sh` to link each skill into:

- `~/.agents/skills/` for Codex across all projects.
- `~/.claude/skills/` for Claude Code across all projects (or the `skills/`
  folder inside `CLAUDE_CONFIG_DIR`, when set).

The main dotfiles `install-symlinks.sh` also runs this installer. Existing
skills are preserved: conflicting paths cause an error instead of being
overwritten. Re-running the installer is safe.

In T3 Code, use **Restart agent session** in the command palette after
installation, then type `$` to select a skill. These links apply on this
machine; run the installer on each remote environment too. Additional Claude
config directories need their own run with `CLAUDE_CONFIG_DIR` set.

PR workflows require an authenticated `gh`; the fallback PR watcher requires
`python3`. `council` and `sol-loop` also need access to the requested reviewer
models. Installing their instructions does not configure provider accounts.

Repository and user instructions still apply, including MyJobBox branch,
Linear linking, release evidence, and Dutch validation comment requirements.
