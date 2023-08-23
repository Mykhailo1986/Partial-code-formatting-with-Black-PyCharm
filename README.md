# Partial-code-formwith-Black-PyCharm
Partial Python code formatting with Black &amp; PyCharm

In the Python world there are several code formatters – e.g. [Black](https://github.com/ambv/black), [YAPF](https://github.com/google/yapf) and [autopep8](https://github.com/hhatto/autopep8). My personal preference is Black as it is deliberately unconfigurable; there’s not much to configure and the tool is rather opinionated about formatting code, resulting in me sometimes hitting `⌥⌘L` in [PyCharm](https://www.jetbrains.com/help/pycharm/reformatting-source-code.html) and Black doing the rest. Notice: this blog post is written specifically with PyCharm and MacOS, although the ideas can be used elsewhere.

For example, Black will automatically format this:

mything = DemoClass('hello', "world",
                    arg1="this",
                        arg2="is",
                            arg3='very',
                                arg4="ugly",
                                    arg5="formatting",
                    arg6="nobody codes like this anyways")

Into this:

mything = DemoClass(
    "hello",
    "world",
    arg1="this",
    arg2="is",
    arg3="very",
    arg4="ugly",
    arg5="formatting",
    arg6="nobody codes like this anyways",
)

However, this poses an issue when working on open source projects as the code reformatting is applied on the entire file, including code that I don’t want to touch. This causes me to reformat the code, copy the changed lines I wanted to format, revert formatting, and replace my lines by the copied lines. This felt clumsy and so I went to investigate.

## Installation and configuration in PyCharm

First, we need to install Black and configure it in PyCharm. It’s available via both Pip and Conda, and runs on Python 3.6 and higher, although it can format older Python code too. After installation you can run `black /path/to/your/file` to format it. Note the exact Black binary location; for example with Conda, the binary is (default) located in /Users/[username]/miniconda3/envs/[envname]/bin/black.

![Black PyCharm configuration](https://godatadriven.com/wp-content/images/bash-black-formatting-selection/pycharm-configuration.png)

To use Black in PyCharm, go to PyCharm -> Preferences… (⌘,) -> Tools -> External Tools -> Click `+` symbol to add new external tool. Configure as shown above and to reformat your current file, go to Tools -> External Tools -> Black. Additionally you could override PyCharm’s default Reformat Code shortcut with Black by [configuring a keymap](https://www.jetbrains.com/help/pycharm/configuring-keyboard-and-mouse-shortcuts.html).

## Partial formatting

Black only formats entire files so this poses an issue when working on open source code. Luckily, in the PyCharm external tool configuration there are many variables available. In the configuration, click on `Insert Macro...` to see them all:

![PyCharm external tool macros](https://godatadriven.com/wp-content/images/bash-black-formatting-selection/pycharm-macros.png)

To apply partial Black formatting, we need at least the selected line numbers which are given by `SelectionStartLine` and `SelectionEndLine`.


## PyCharm shortcut

Finally, create a PyCharm shortcut for formatting a selection:

![PyCharm keymap for formatting selection](https://godatadriven.com/wp-content/images/bash-black-formatting-selection/pycharm-selection-keymap.png)

With this `⌥⌘;` shortcut we can now call the script to format only the selection:

![PyCharm code selection formatted](https://godatadriven.com/wp-content/images/bash-black-formatting-selection/pycharm-code-selection-formatted.png)


