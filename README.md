# JesseTeX

JesseTeX is a LaTeX package with the goal of removing the preamble, including many regular packages and macros.

## Installation

Install the packages as described by your distribution.

## Usage

To start writing an article in JesseTeX, use
```LaTeX
\documentclass{article}
\usepackage[options]{JesseTeX}

\title{title}

\begin{document}
\maketitle
foobar
\end{document}
```
You can also add one or several authors in the title using
```LaTeX
\author{name\\000000} OR \author{name1\\000000 \authand name2\\000000}
```
Furthermore, a problem class can be added into the title with
```LaTeX
\tutorial{tutorial group}
```

### Options

The options for JesseTeX are:

`theme` (string option) can be set to either `true` or `false`. Dictates whether JesseTeX changes the article's visual theme.

`lang` (string option) can be set to any Babel language. Currently, JesseTeX supports custom theorem-like environments for `dutch` and `english`, defaulting to `dutch`.

`nocount` (void option) if used, removes the total amount of pages from the title.

`numbering` (string option) makes theorem-like environment counters subordinate to the counter given in the option. For example, you could use `[numbering = section]`, so theorem numbering looks like Theorem 1.2.

### Packages included

<details>
<summary>Technical packages</summary>

`kvoptions`

`ifthen`

`xstring`

`xparse`

`xspace`

</details>

<details>
<summary>Base packages</summary>

`color`

`babel`

`inputenc` (`utf8`)

`graphicx`

`amsmath`

`amsfonts`

`amssymb`

`mathrsfs`

`tensor`

`slashed`

`physics` (with an altered definition of derivatives)

`mathtools`

`wasysym`

`amsthm`

`thmtools`

`lastpage`

`textcomp`

`fancyhdr`

`comment`

`tabularx`

`tikz`

`pgfplots`

</details>

<details>
<summary>Theme packages (only included if JesseTeX influences the theme)</summary>

`geometry` (`margin = 1 in, a4paper`)

`hyperref` (`linkcolor = red`)

`ocgx2` (`ocgcolorlinks`)

`biblatex` (`sorting = none`)

</details>

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
