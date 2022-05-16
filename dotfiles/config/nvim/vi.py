import sys
from pathlib import Path
import subprocess as sp

adoc = frozenset(['adoc', 'asdiidoc'])
fs = frozenset(['fs', 'fsi', 'fsx'])
hs = frozenset(['hs', 'lhs'])
julia = frozenset(['jl'])
lisp = frozenset(['lisp'])
ml = frozenset(['ml', 're'])
py = frozenset(['py'])
R = frozenset(['R', 'Rmd'])
sql = frozenset(['hql', 'sql'])

file_types = {adoc: 'adoc', fs: 'fsharp', hs: 'haskell', julia: 'julia',
              lisp: 'lisp', ml: 'reasonml', py: 'python', R: 'R', sql: 'sql'}

usage = """Usage: vi -h | <file> [as <extension>]
Examples: vi my-script.py
          vi my-script as py
Supported extensions:\n  * """ + '\n  * '.join([', '.join(lang) for lang in file_types])

vimrc_root = Path.home() / '.config/nvim'

def edit_with_type(lang: str):
    sp.run(['cp', vimrc_root / f"{lang}.vim", vimrc_root / 'init.vim'])
    sp.run(['nvim', sys.argv[1]])
    sys.exit(0)

if len(sys.argv) == 2:
    if sys.argv[1] == '-h':
        print(usage)
        sys.exit(0)
    else:
        suffix = Path(sys.argv[1]).suffix[1:]  # [1:] to remove the leading `.` if exists
        lng = [file_types[k] for k in file_types if suffix in k]
        edit_with_type('text' if len(lng) == 0 else lng[0])

if (len(sys.argv) == 4) and (sys.argv[2] == 'as'):
    lng = [file_types[k] for k in file_types if sys.argv[3] in k]
    edit_with_type('text' if len(lng) == 0 else lng[0])

sp.run(['nvim'] + sys.argv[1:])

