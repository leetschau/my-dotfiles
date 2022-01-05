if not status is-interactive
  exit 0
end

abbr ra ranger
abbr l ls -la
abbr gs git status
abbr gci git commit
abbr gd git diff
abbr gl git log
abbr glg git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ai%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
abbr gco git checkout

abbr tl tmux ls
abbr ta tmux attach -t
abbr tn tmux new -A -s
