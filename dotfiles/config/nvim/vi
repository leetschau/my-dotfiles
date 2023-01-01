#!/usr/bin/python3

import sys
from pathlib import Path
import subprocess as sp

"""
For this dict, key is a language name, matching the filename (without
extension '.vim') in this folder, value is a set containing all valid
file extensions of this language.
"""
lang_extensions = {
        'adoc': {'adoc', 'asciidoc'},
        'C': {'c'},
        'fsharp': {'fs', 'fsi', 'fsx'},
        'haskell': {'hs', 'lhs'},
        'julia': {'jl'},
        'lisp': {'lisp'},
        'nim': {'nim'},
        'ocaml': {'ml'},
        'python': {'py', 'xsh'},
        'R': {'R'},
        'reasonml': {'re'},
        'rust': {'rs'},
        'sql': {'sql'},
        'zeek': {'zeek'},
}

usage = """Usage: vi -h | <file> [as <lang-name>]
Examples: vi my-script.py  # set file type implicitly by file extension
          vi my-script as python  # set file type explicitly by <lang-name>
Supported <lang-name>:\n  * """ + '\n  * '.join(
    [lang for lang in lang_extensions])

vimrc_root = Path.home() / '.config/nvim'


def edit_with_type(lang: str):
    sp.run(['cp', vimrc_root / f"{lang}.vim", vimrc_root / 'init.vim'])
    vft = 'markdown' if lang == 'text' else lang
    sp.run(['nvim', f"+set filetype={vft}", sys.argv[1]])
    sys.exit(0)


if len(sys.argv) == 2:
    if sys.argv[1] == '-h':
        print(usage)
        sys.exit(0)
    else:
        suffix = Path(sys.argv[1]).suffix[1:]
        # [1:] to remove the leading `.` if exists
        lng = [k for k in lang_extensions if suffix in lang_extensions[k]]
        edit_with_type('text' if len(lng) == 0 else lng[0])

if (len(sys.argv) == 4) and (sys.argv[2] == 'as'):
    edit_with_type(sys.argv[3])

sp.run(['nvim'] + sys.argv[1:])
