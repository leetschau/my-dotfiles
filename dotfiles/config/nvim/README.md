# Neovim related Configurations and Scripts

## Editor Usage

Put this folder somewhere on your file system, by default, ~/.config.
Then add the following codes into your rc file:

    export LUA_PATH=~/.config/nvim/?.lua
    alias vi="python $HOME/.config/nvim/vi_lua_conf.py"

Now `vi -h` and happy coding!

## When Keyboard Shortcut Not Work

When keyboard shortcut (for example, `,o` to open SymbolOutliner) doesn't
work and there's no error message, it's probably the corresponding plugin
doesn't be installed yet. Run `:PaqInstall` in neovim and restart it.
Then try the shortcut again.
If still no luck, Run `:PaqList` to see if the plugin is installed successfully.

## REPL in Editor

### Usage

[iron](https://github.com/hkupty/iron.nvim) is used for REPL in editor.
Its keyboard shortcuts are defined in `iron:setup -> keymaps`,
which is now written in julia.lua. Later it maybe moved to text.lua.

Or you can use `:map` to list loaded keyboard shortcuts in editor session.

## vi Starup Script

### On File Type Definitions

Keys of `FTYPES` in vi script are language names,
matching the filenames (without extension '.vim/.lua') in this folder.
Meanwhile they're the name used when setting the `filetype` in vim.
For example: `:set filetype=python` works as expected,
while `:set filetype=py` won't make vim render the file as a Python script.

Each value of the dict is a list containing all possible file extensions of this language.

List all available filetypes in vim with `:setfiletype ` and press Ctrl-d.
Note the space in the end can't be omitted.
And there's no space between `set` and `filetype`.
See [List known filetypes](https://vi.stackexchange.com/questions/5780/list-known-filetypes) for details.

For file extensions not recognized by neovim by default,
you can add it into its configuration file to make it rendered properly.
For example, to render files with extension `.xsh` as Python scripts,
add the following snippet into python.vim:
```
au BufRead,BufNewFile *.xsh setfiletype python
```

See [Persistent :set syntax for a given filetype?](https://stackoverflow.com/questions/11666170/persistent-set-syntax-for-a-given-filetype) for details.
