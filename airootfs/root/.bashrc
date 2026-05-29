#
# ~/.bashrc
#
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

eval "$(starship init bash)"
fastfetch --logo /usr/share/pixmaps/gory-installer-logo.png --logo-type chafa --logo-width 35
