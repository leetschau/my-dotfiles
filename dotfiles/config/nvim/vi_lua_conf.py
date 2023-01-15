import sys
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

def generate_plugins_script(plugins: List[str], pm: str) -> str:
    if pm == 'paq':
        pkgls = '\n'.join([f'  "{p}";' for p in plugins])
        return 'require "paq" {\n  "savq/paq-nvim";\n' + pkgls + '\n}'
    elif pm == 'vam':
        pkgls = '\n'.join([r'  \ github:' + p for p in plugins])
        return f'vim.cmd [[\n{VAM_SETUP}\nVAMActivate\n{pkgls}\n]]'
    else:
        return f'Bad plugin manager name: {pm}'

def synthetic_config_path(fpath: str,
                          pm: str,
                          ft_maps: Dict[str, List[str]]) -> str:

    edited_file_suffix = Path(fpath).suffix[1:]  # [1:] to remove the leading `.` if exists
    matched_langs = [k for k in ft_maps if edited_file_suffix in ft_maps[k]]
    lang = 'langbase' if len(matched_langs) == 0 else matched_langs[0]

    plugins = []
    collect_plugins(lang, plugins)
    plugin_script = generate_plugins_script(plugins, pm)

    final_conf_path = CONF_ROOT / 'init.lua'
    lang_conf = Path(CONF_ROOT / (lang + EXT)).read_text()

    with open(final_conf_path, 'w') as f:
        f.write(f"{lang_conf}\n{plugin_script}")
    return str(final_conf_path)

def parse_args(fts: List[str],
               pms: List[str],
               defpm: str) -> argparse.Namespace:
    parser = argparse.ArgumentParser(prog='vi',
                                     description='versatile vim.')
    parser.add_argument('files',
                        metavar='FILE',
                        nargs='*',
                        help='file to be edited')
    parser.add_argument('-p',
                        choices=PLUGINS,
                        default=DEFAULT_PLUGIN,
                        dest='plugin_manager',
                        metavar='PM',
                        help='which plugin manager to use [paq|vam], default: paq')
    return parser.parse_args()

def main():
    args = parse_args(FTYPES.keys(), PLUGINS, DEFAULT_PLUGIN)
    if len(args.files) > 0:
        sp.run(['nvim', '-u', synthetic_config_path(args.files[0], args.plugin_manager, FTYPES)] + args.files)
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

PLUGINS = ['paq', 'vam']
DEFAULT_PLUGIN = 'paq'

VAM_SETUP = """fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.local/vim'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()
"""

main()
