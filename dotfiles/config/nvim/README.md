# Neovim related Configurations and Scripts

## Editor Usage

Put this folder somewhere on your file system, by default, ~/.config.
A better way is using a dotfiles manager, such as [dotdrop](),
and `install` configurations files into system.

Then add the following codes into your rc file:

    export LUA_PATH=~/.config/nvim/?.lua
    alias vi="python $HOME/.config/nvim/vi.py"

Now `vi -h` and happy coding!

## REPL in Editor

[iron](https://github.com/hkupty/iron.nvim) is used for REPL in editor.
Its keyboard shortcuts are defined in `iron:setup -> keymaps`,
which is now written in julia.lua. Later it maybe moved to text.lua.

Or you can use `:map` to list loaded keyboard shortcuts in editor session.

## vi Startup Script

The `-i` option is the executable name (in your $PATH) or absolute path of the interpreter embedded in vi,
such as `julia`, `ruby`, `python`, `ipython`, `xonsh`, `R`, etc.
When the interpreter is Python in a virtualenv,
get the path with `poetry env info` or something alike,
for example, "~/.cache/pypoetry/virtualenvs/driftstudy-NYOhBOOU-py3.10/bin/python".

## When Keyboard Shortcut Not Work

When keyboard shortcut (for example, `,o` to open SymbolOutliner) doesn't
work and there's no error message, it's probably the corresponding plugin
doesn't be installed yet. Run `:PaqInstall` in neovim and restart it.
Then try the shortcut again.
If still no luck, Run `:PaqList` to see if the plugin is installed successfully.

