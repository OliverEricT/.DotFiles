#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

LS_COLORS='di=04;34:ow=04;34' ; export LS_COLORS

alias ls='ls --l --color'
alias grep='grep --color=auto'
alias clear='clear && fastfetch'
PS1='[\u@\h \W]\$ '

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


fastfetch
