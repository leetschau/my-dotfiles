if status is-interactive
    source ~/.asdf/asdf.fish
    source /usr/share/autojump/autojump.fish
    set -x PATH $HOME/.local/bin $PATH
    fish_vi_key_bindings
    starship init fish | source
end
