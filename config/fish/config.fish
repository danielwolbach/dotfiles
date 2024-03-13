if status is-interactive
    if not set -q TMUX
        set -gx SHELL "/usr/bin/fish"
        exec tmux new-session -A -s main
    end

    set fish_greeting

    fish_add_path "~/.local/bin"
    fish_add_path "~/.cargo/bin"

    set -gx EDITOR "hx"
    set -gx VISUAL "hx"
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT "-c"

    starship init fish | source
end
