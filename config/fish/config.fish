if status is-interactive
    # Configure Starship
    starship init fish | source

    # Set variables
    set fish_greeting
    set -gx COLORTERM "truecolor"
    set -gx EDITOR "helix"
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

    # Configure aliases
    alias hx "helix"
    alias ls "exa --icons"
    alias ll "exa --long --icons --git --header"
    alias tree "exa --icons --tree"
    alias bat "bat --style full --theme ansi"
    alias cat "bat --style plain --theme ansi"

    # Start Tmux
    if status is-interactive
    and not set -q TMUX
        exec tmux new-session -A -s main
    end
end
