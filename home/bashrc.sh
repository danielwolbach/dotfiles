# Set an alias, but only if the target command is installed.
set_alias() {
    local alias_name="$1"
    local target_command="$2"
    local target_program=$(echo "$target_command" | awk '{print $1}')
    if command -v "$target_program" &> /dev/null; then
        alias "$alias_name"="$target_command"
    fi
}

# Add to path, but only if the path exists and it is not already in the path.
add_path() {
    local directory="$1"
    if [ -d "$directory" ]; then
        if [[ ":$PATH:" != *":$directory:"* ]]; then
            export PATH="$directory:$PATH"
        fi
    fi
}

# Attach `tmux` by creating a new session.
attach_tmux() {
    if [ -z "$TMUX" ]; then
        if command -v tmux &> /dev/null; then
            tmux new-session
            exit
        fi
    fi
}

# Launch the custom prompt `starship`.
launch_prompt() {
    if command -v starship &> /dev/null; then
        eval "$(starship init bash)"
    fi
}

# Configure everything.
main() {
    # Source global definitions.
    if [ -f /etc/bashrc ]; then
        source /etc/bashrc
    fi

    # Set aliases.
    set_alias "ls" "eza --icons"
    set_alias "ll" "eza --icons --long --git --header"
    set_alias "tree" "eza --icons --tree"
    set_alias "bat" "bat --style full --theme ansi"
    set_alias "cat" "bat --style plain --theme ansi"
    set_alias "hx" "helix"

    # Add to path.
    add_path "$HOME/.local/bin"

    # Set variables.
    export COLORTERM="truecolor"

    # Start programs.
    launch_prompt
    attach_tmux
}

main

