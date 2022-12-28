$PROMPT = '{YELLOW}{env_name}{BLUE}{user}@{hostname}:{GREEN}{cwd} {ITALIC_YELLOW}{gitstatus} {RESET}\n> '
$RIGHT_PROMPT = '{localtime}'

$AUTO_CD = True

xontrib load hist_navigator

aliases['ddp'] = 'dotdrop'

aliases['ga'] = 'git add -A'
aliases['gci'] = 'git commmit'
aliases['gco'] = 'git checkout'
aliases['gd'] = 'git diff'
aliases['gl'] = 'git log '
aliases['glg'] = "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%ai%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
aliases['gs'] = 'git status'

aliases['l'] = 'ls -la'
aliases['ll'] = 'ls -lh'
aliases['lt'] = 'ls -lt'
aliases['ltr'] = 'ls -ltr'

aliases['ta'] = 'tmux attach -t'
aliases['tl'] = 'tmux ls'
aliases['tn'] = 'tmux new -A -s'

aliases['vi'] = "python3 ~/.config/nvim/vi.py"
