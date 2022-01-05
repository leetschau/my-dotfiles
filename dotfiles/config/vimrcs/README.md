# Vim/Neovim Configurations

vim/neovim loads its configs from $XDG_CONFIG_HOME/nvim/init.vim.
By changing the value of XDG_CONFIG_HOME,
we can load different configurations for different scenarios.

Compared with [vem](https://github.com/leetschau/vem),
this method has no external dependencies.
After configurations changed, they take effects at once without regenerating init.vim,
which makes experiments more convenient.

## Usage

Configurations for different scenarios are put into different folders.
If using neovim as a bare editor without any plugins, start nvim with:
```
XDG_CONFIG_HOME=$REPO_ROOT nvim myscript.py
```

As a enhanced editor, with some general text editing plugins,
such as minibuffer, CtrlP, nerdtree, etc, start nvim with:
```
XDG_CONFIG_HOME=$REPO_ROOT/text nvim myscript.py
```

As a Python editor, start nvim with:
```
XDG_CONFIG_HOME=$REPO_ROOT/python nvim myscript.py
```

And for nim, asciidoc, etc.

With the help of [direnv](https://direnv.net/),
the configs can change automatically for different projects.

For example, neovim will automatically loads Python configs
by adding the following lines into .envrc
of the Python project root folder:
```
export XDG_CONFIG_HOME=$HOME/Documents/sources/vimrcs/asciidoc
```

## Language Specific Setup

### SQL

The auto-formatting for SQL script depends on `sqlformat`,
Install it with `apt` or `pip`.

### F#

According to installation instructions in [fsharp/vim-fsharp](https://github.com/fsharp/vim-fsharp),
you need to run `make fsautocomplete` in the plugin folder,
and make sure file ftplugin/bin/fsautocomplete.exe exists.

## Default Folder Setup

Put init.vim with enhanced editor level into the default config folder
~/.config/nvim.

Hence it will be OK when editing files without specify XDG_CONFIG_HOME.

## Problems

XDG_CONFIG_HOME is not used only by vim.
If it's used by other applications in the same project,
they won't find their config files.

In this case, you have to remove the definition of XDG_CONFIG_HOME
from .envrc. And use alias instead:
```
alias vi="XDG_CONFIG_HOME=$REPO_ROOT/asciidoc nvim"
```

For direnv hasn't support alias yet,
you can use [desk](https://github.com/jamesob/desk) to define a deskfile,
with the alias definition in it.

## Other Potential Solutions

The vim internal variable MYVIMRC can be used to load configs *after* vim startup.
So it's unsuitable for this work-flow,
even in MYVIMRC style the config directory structure will be far more concise:
```
vimrcs
.
├── asciidoc.vim
├── base.vim
├── langbase.vim
├── nim.vim
├── README.md
└── text.vim
```

