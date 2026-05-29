#
# ~/.zshrc
#

if [[ -f /etc/zsh/zshrc ]]; then
    source /etc/zsh/zshrc
fi

eval "$(starship init zsh)"
fastfetch --logo /usr/share/pixmaps/gory-installer-logo.png --logo-type chafa --logo-width 35
