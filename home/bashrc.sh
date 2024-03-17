if [ -f "/etc/bashrc" ]; then
    source "/etc/bashrc"
fi

if [[ $- == *i* ]]
then
    export PATH="$PATH:~/.local/bin"
    export PATH="$PATH:~/.cargo/bin"
    export EDITOR="hx"

    export VISUAL="hx"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
    export HISTCONTROL="ignoreboth:erasedups"

    export PS1="[\W]$ "

    bind "set show-all-if-ambiguous on"
    bind "TAB:menu-complete"
    bind "\"\e[Z\":menu-complete-backward"

    alias ls="eza --icons"
    alias ll="eza --icons --long --header --git"
    alias la="eza --icons --long --header --git --all"
    alias tree="eza --icons --tree --git-ignore"
fi
