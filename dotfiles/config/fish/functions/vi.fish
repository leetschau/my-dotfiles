function vi
  set ext (string split -r -m1 . $argv[1])[2]
  switch $ext
    case adoc asciidoc
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/asciidoc nvim $argv
    case fsi fsx fs
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/fsharp nvim $argv
    case hs lhs
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/haskell nvim $argv
    case lisp
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/lisp nvim $argv
    case ml re
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/reasonml nvim $argv
    case py
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/python nvim $argv
    case R Rmd
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/R nvim $argv
    case sql hql
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/sql nvim $argv
    case '*'
      XDG_CONFIG_HOME=$HOME/.config/vimrcs/text nvim $argv
  end
end
 
