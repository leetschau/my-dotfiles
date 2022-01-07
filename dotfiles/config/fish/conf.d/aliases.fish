if not status is-interactive
  exit 0
end

abbr ddp dotdrop

abbr ga git add -A
abbr gs git status
abbr gci git commit -m
abbr gd git diff
abbr gl git log
abbr glg git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ai%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
abbr gco git checkout
abbr gph git push
abbr gpl git pull

abbr l ls -la

abbr ra ranger

abbr tl tmux ls
abbr ta tmux attach -t
abbr tn tmux new -A -s
