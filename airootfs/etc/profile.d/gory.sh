# Gory OS BASH Configuration
alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -n "$BASH_VERSION" ]; then
    if [ -z "$FASTFETCH_RUN" ]; then
        export FASTFETCH_RUN=1
        fastfetch --logo /usr/share/pixmaps/gory-installer-logo.png --logo-type chafa --logo-width 35
    fi
    eval "$(starship init bash)"
fi
