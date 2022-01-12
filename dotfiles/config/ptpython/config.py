__all__ = (
    'configure',
)

def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    """
    repl.vi_mode = True
    repl.confirm_exit = False
    repl.show_signature = True
    repl.show_docstring = True
    repl.show_sidebar_help = True
    repl.enable_auto_suggest = True
    repl.enable_fuzzy_completion = True
    repl.enable_dictionary_completion = True
    repl.highlight_matching_parenthesis = True
