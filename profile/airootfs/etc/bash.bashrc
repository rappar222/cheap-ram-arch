# /etc/bash.bashrc - System-wide color configuration for interactive bash

[[ $- != *i* ]] && return

# Colorized dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Colorized command aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Colorized man pages
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'

# Default prompt with color
if [ "$EUID" -eq 0 ]; then
    PS1='\[\e[1;31m\]\u\[\e[0m\]@\[\e[1;36m\]cheap-ram\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]# '
else
    PS1='\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;36m\]cheap-ram\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '
fi
