if [ -f "/etc/bashrc" ]; then
    source "/etc/bashrc"
fi

if [ -z "$TMUX" ]; then
    exec tmux new-session -A -s main
fi

export PATH="$PATH:~/.local/bin"
export PATH="$PATH:~/.cargo/bin"

export EDITOR="hx"
export VISUAL="hx"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

export PS1="[\W]$ "

alias ls="eza --icons"
alias ll="eza --icons --long --header --git"
alias la="eza --icons --long --header --git --all"
alias tree="eza --icons --tree --git-ignore"
