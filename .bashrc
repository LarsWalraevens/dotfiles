# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
export EDITOR=nano
export VISUAL=nano

# Better history
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Save multi-line commands in history correctly
PROMPT_COMMAND="history -a; history -n"

# Color prompt
PS1='\[\e[38;2;50;180;250m\]\u@\h\[\e[0m\]:\[\e[38;2;250;200;50m\]\w\[\e[0m\] \[\e[38;2;250;200;50m\]❯\[\e[0m\] '

# Aliases (safe defaults)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Helpful safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
export PATH="$HOME/.local/bin:$PATH"
