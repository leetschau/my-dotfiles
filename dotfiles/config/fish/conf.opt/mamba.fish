if test -f ~/.local/opt/mambaRoot/etc/fish/conf.d/mamba.fish
    eval ~/.local/opt/mambaRoot/bin/conda "shell.fish" "hook" $argv | source
end

if test -f ~/.local/opt/mambaRoot/etc/fish/conf.d/mamba.fish
    source ~/.local/opt/mambaRoot/etc/fish/conf.d/mamba.fish
end
