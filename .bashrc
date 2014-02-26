# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
[ -z "$TMUX" ] && export TERM=xterm-256color
