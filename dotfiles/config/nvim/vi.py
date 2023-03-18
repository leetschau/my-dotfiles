import sys
import re
import argparse
from typing import List, Dict
from pathlib import Path
import subprocess as sp


def collect_plugins(lang: str, plugins: List[str]) -> List[str]:
    conf_path = Path(CONF_ROOT / (lang + EXT))
    if not conf_path.is_file():
        sys.exit(f'File {conf_path} not exists.\n'
                 'Check which configuration file `require` it. '
                 'Or if there are errors in vi script.')
    lang_conf = conf_path.read_text()
    first_line = lang_conf.split('\n')[0].strip()
    if first_line.startswith('require'):
        required = first_line[9: -1]
        collect_plugins(required, plugins)
    lines = lang_conf.split('\n')
    plugins.extend([pl[8:] for pl in lines if pl.startswith('-- pkg:')])

def generate_plugins_script(plugins: List[str]) -> str:
    pkgls = '\n'.join([f'  "{p}";' for p in plugins])
    return 'require "paq" {\n  "savq/paq-nvim";\n' + pkgls + '\n}'

def synthetic_config_path(fpath: str,
                          pyi: str,
                          ft_maps: Dict[str, List[str]]) -> str:

    edited_file_suffix = Path(fpath).suffix[1:]  # [1:] to remove the leading `.` if exists
    matched_langs = [k for k in ft_maps if edited_file_suffix in ft_maps[k]]
    lang = 'langbase' if len(matched_langs) == 0 else matched_langs[0]

    plugins = []
    collect_plugins(lang, plugins)
    plugin_script = generate_plugins_script(plugins)

    final_conf_path = CONF_ROOT / 'init.lua'
    lang_conf = Path(CONF_ROOT / (lang + EXT)).read_text()
    final_conf_path.write_text(f"{lang_conf}\n{plugin_script}")
    # update Python interpreter if specified:
    if pyi is None:
        return str(final_conf_path)

    lines = (CONF_ROOT / 'langbase.lua').read_text().splitlines()
    (CONF_ROOT / 'langbase.lua').write_text(
            '\n'.join(
                map(lambda x: re.sub(r'(.*")(.*)(".*)',
                                     rf'\1{pyi}\3',
                                     x)
                              if x.strip().startswith('python = { command = {')
                              else x,
                    lines)))
    return str(final_conf_path)

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(prog='vi',
                                     description='versatile vim.')
    parser.add_argument('files',
                        metavar='FILE',
                        nargs='*',
                        help='file to be edited')
    parser.add_argument('-i',
                        dest='py_interpreter',
                        metavar='INTERPRETER',
                        help='''Full path of Python interpreter.
In a virtualenv, get the path with `poetry env info` or something alike.
For example: /home/leo/.cache/pypoetry/virtualenvs/driftstudy-NYOhBOOU-py3.10/bin/python.
Other interpreters, such as `ipython`, `ptipython`, `xonsh` are also valid.''')
    return parser.parse_args()

def main():
    args = parse_args()
    if len(args.files) > 0:
        sp.run(['nvim',
                '-u',
                synthetic_config_path(args.files[0],
                                      args.py_interpreter,
                                      FTYPES)
                ] + args.files)
    else:
        sp.run(['nvim'])

# see explaination about this dict in README
FTYPES: Dict[str, List[str]] = {
    'asciidoc': ['adoc', 'asciidoc'],
    'c': ['c', 'h'],
    'fsharp': ['fs', 'fsi', 'fsx'],
    'haskell': ['hs', 'lhs'],
    'julia': ['jl'],
    'lisp': ['lisp'],
    'text': ['md', 'Rmd'],
    'nim': ['nim'],
    'ocaml': ['ml'],
    'python': ['py', 'xsh'],
    'r': ['R'],
    'reason': ['re'],
    'rust': ['rs'],
    'sql': ['sql'],
    'zeek': ['zeek'],
}
EXT = '.lua'
CONF_ROOT = Path(__file__).parent  # make sure config files (.vim/.lua) live in the same folder with this script

main()
