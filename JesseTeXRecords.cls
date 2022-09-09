% Copyright (C) 2003-2015 TeXniCie A-Eskwadraat <hektex@a-eskwadraat.nl>
%
% This file is part of the A-Eskwadraat LaTeX collection and may be
% redistributed under the terms of version 2 of the GNU General Public License
% as published by the Free Software Foundation. See LICENSE file for details.
%
%% $Id: notulen.cls 826 2018-01-17 13:36:08Z peterspeets $

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JesseTeXRecords}[2021/12/24 A--Eskwadraat records document type for JesseTeX]

\newif\ifeng@art \eng@artfalse
\DeclareOption{english}{\eng@arttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}

\newif\ifnotulen@stiekemext \notulen@stiekemextfalse

\RequirePackage{eurosym, helvet, lineno, ifthen}
\RequirePackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\familydefault{\sfdefault}

\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\section}{
  \@startsection{section}{1}{\z@}
    {-2.5ex \@plus -1ex \@minus -.2ex}
    {1.3ex \@plus.2ex}
    {\normalfont\Large\bfseries}}
\renewcommand{\subsection}{
  \@startsection{subsection}{2}{\z@}
    {-1.25ex\@plus -1ex \@minus -.2ex}
    {0.5ex \@plus .2ex}
    {\normalfont\large\itshape}}
\renewcommand{\subsubsection}{
  \@startsection{subsubsection}{3}{\z@}
    {-1.00ex \@plus -0.50ex \@minus -0.50ex}
    {-1.00ex \@plus -0.50ex \@minus -0.50ex}
    {\normalfont\normalsize\itshape\bfseries}}
\renewcommand{\paragraph}{
  \@startsection{paragraph}{4}{\z@}
    {0.00ex \@plus0.1ex}
    {-1em}
    {\normalfont\normalsize\nameshape}}
% \renewcommand{\subparagraph}{
%   \@startsection{subparagraph}{5}{\parindent}
%     {3.25ex \@plus1ex \@minus .2ex}
%     {-1em}
%     {\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifeng@art\newcommand{\besluitenlijstnaam}{Resolutions}
\else\newcommand{\besluitenlijstnaam} {Besluitenlijst}
\fi


\newcommand{\besluitenlijstentry}{
  \addcontentsline{toc}{section}{\besluitenlijstnaam}
}

\newcommand\besluitenlijst{%
    \besluitenlijstentry
    \section*{\besluitenlijstnaam
      \@mkboth{\MakeUppercase\besluitenlijstnaam}%
              {\MakeUppercase\besluitenlijstnaam}}%
    \@starttoc{lob}%
    }

\newcommand{\l@besluit}{\@dottedtocline{1}{1.5em}{2.3em}}


\newcommand{\besluit}[1]{ %Er wordt naar level en huidigniveau gekeken of besluit in besluitenlijst mag komen.
\ifnotulen@stiekemext
\addtocounter{level}{-1}
\ifnum \thelevel < \thestiekemext@huidigniveau %met addtocounter wordt dit kleiner of gelijk aan
\par
  \ifeng@art\textbf{Decision:}\else\textbf{Besluit:}\fi \hspace{5mm} #1 %kandidaat voor aestaal migratie?
  \addcontentsline{lob}{besluit}
    {\hetbesluit\hspace{1em}{{\color{niveau\thestiekemext@huidigniveau}#1}}}
  \addtocounter{besluit}{1}
\fi
\addtocounter{level}{1}
\else

\par
  \ifeng@art\textbf{Decision:}\else\textbf{Besluit:}\fi \hspace{5mm} #1
  \addcontentsline{lob}{besluit}
    {\hetbesluit\hspace{1em}{#1}}
  \addtocounter{besluit}{1}
\fi
}

\newcounter{besluit}
\setcounter{besluit}{1}
\newcommand{\hetbesluit}{\@arabic\c@besluit}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%De onderstaande code is gecopypaste van het bovenstaande.  (besluit, advies, van- voor het bestuur en ar zijn hetzelfde)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifeng@art
\newcommand{\adviezenlijstnaam} {Advices}
\else
\newcommand{\adviezenlijstnaam} {Adviezenlijst}
\fi

\newcommand{\adviezenlijstentry}{
  \addcontentsline{toc}{section}{\adviezenlijstnaam}
}

\newcommand\adviezenlijst{%
    \adviezenlijstentry
    \section*{\adviezenlijstnaam
      \@mkboth{\MakeUppercase\adviezenlijstnaam}%
              {\MakeUppercase\adviezenlijstnaam}}%
    \@starttoc{lobadvies}%
    }

\newcommand{\l@advies}{\@dottedtocline{1}{1.5em}{2.3em}}


\newcommand{\advies}[1]{ %Er wordt naar level en huidigniveau gekeken of besluit in advieslijst mag komen.
\ifnotulen@stiekemext
\addtocounter{level}{-1}
\ifnum \thelevel < \thestiekemext@huidigniveau %met addtocounter wordt dit kleiner of gelijk aan
\addtocounter{level}{1}
\par
  \ifeng@art\textbf{Recommendation:}\else\textbf{Advies:} \fi \hspace{5.5mm} #1
  \addcontentsline{lobadvies}{advies}
    {\hetadvies\hspace{1em}{{\color{niveau\thestiekemext@huidigniveau}#1}}}
  \addtocounter{advies}{1}
\addtocounter{level}{-1}
\fi
\addtocounter{level}{1}
\else

\par
  \ifeng@art\textbf{Recommendation:}\else\textbf{Advies:} \fi \hspace{5.5mm} #1
  \addcontentsline{lobadvies}{advies}
    {\hetadvies\hspace{1em}{#1}}
  \addtocounter{advies}{1}
\fi
}


\newcounter{advies}
\setcounter{advies}{1}
\newcommand{\hetadvies}{\@arabic\c@advies}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%De onderstaande code is gecopypaste van het bovenstaande.  (besluit, advies, van- voor het bestuur en ar zijn hetzelfde)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifeng@art
\newcommand{\aanhetbestuurnaam} {To the board}
\else
\newcommand{\aanhetbestuurnaam} {Aan het bestuur}
\fi

\newcommand{\aanhetbestuurentry}{
  \addcontentsline{toc}{section}{\aanhetbestuurnaam}
}

\newcommand\aanhetbestuur{%
    \aanhetbestuurentry
    \section*{\aanhetbestuurnaam
      \@mkboth{\MakeUppercase\aanhetbestuurnaam}%
              {\MakeUppercase\aanhetbestuurnaam}}%
    \@starttoc{lobahb}%
    }

\newcommand{\l@ahb}{\@dottedtocline{1}{1.5em}{2.3em}}


\newcommand{\ahb}[1]{\par
  \ifeng@art\textbf{To the board:}\else\textbf{Aan het bestuur:} \fi \hspace{5.5mm} #1
  \addcontentsline{lobahb}{ahb}
    {\ahbestuur\hspace{1em}{#1}}
  \addtocounter{ahb}{1}
}

\newcounter{ahb}
\setcounter{ahb}{1}
\newcommand{\ahbestuur}{\@alph\c@ahb}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%De onderstaande code is gecopypaste van het bovenstaande. (besluit, advies, van- voor het bestuur en ar zijn hetzelfde)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifeng@art
\newcommand{\aanadviesraadnaam} {To advisory board}
\else
\newcommand{\aanadviesraadnaam} {Aan de adviesraad}
\fi

\newcommand{\aanadviesraadentry}{
  \addcontentsline{toc}{section}{\aanadviesraadnaam}
}

\newcommand\aanadviesraad{%
    \aanadviesraadentry
    \section*{\aanadviesraadnaam
      \@mkboth{\MakeUppercase\aanadviesraadnaam}%
              {\MakeUppercase\aanadviesraadnaam}}%
    \@starttoc{lobaar}%
    }

\newcommand{\l@aar}{\@dottedtocline{1}{1.5em}{2.3em}}


\newcommand{\aar}[1]{\par
  \ifeng@art\textbf{To advisory board:}\else\textbf{Aan de adviesraad:} \fi \hspace{5.5mm} #1
  \addcontentsline{lobaar}{aar}
    {\aadviesraad\hspace{1em}{#1}}
  \addtocounter{aar}{1}
}

\newcounter{aar}
\setcounter{aar}{1}
\newcommand{\aadviesraad}{\@alph\c@aar}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\ifeng@art
\newcommand{\aplijstnaam}{List of Assigned Tasks}
\else
\newcommand{\aplijstnaam}{Actiepunten}
\fi
\newcommand{\aplijstentry}{
  \addcontentsline{toc}{section}{\aplijstnaam}
}

% Hulpcommando. Maakt een aplijst nadat je een \@actiepunt-
% commando hebt gedefinieerd.
\newcommand\ap@maakaplijst{%
  \aplijstentry
  \section*{\aplijstnaam
    \@mkboth{\MakeUppercase\aplijstnaam}%
            {\MakeUppercase\aplijstnaam}}%
  \@starttoc{loa}%
}


\def\verwijdern@@m#1#2{%
\def\cleanup##1, !{%
##1%
}
\def\verwijder##1#2, ##2\relax{%
\global\edef\tempn@menlijst{##1##2}%
}
\verwijder#1, \relax%
\expandafter\cleanup\tempn@menlijst!%
}

% definieert een \@actiepunt voor gebruik bij de \aplijstpp, \aplijst
% herdefinieert dit commando in hetgeen hij nodig heeft.
\def\@actiepunt#1#2#3{% <- naam, actiepunt, pagina
  %
  % Zoek ##1 op in alle al bekende namen:
  \def\splitn@@m##1, {%
  \setcounter{ap@curnaam}{0}%
  \setboolean{ap@gebakt}{false}%
    \ifx\relax##1%
      \let\next@@\relax
    \else
      \let\next@@\splitn@@m
      \whiledo{\theap@curnaam < \theap@namen}{%
        \ifthenelse{\equal{##1}{\csname ap@naam\theap@curnaam\endcsname}}{%
          % Gevonden.
          % Laad het aantal eerdere taken van deze persoon in een counter:
          \setcounter{ap@tmp}{\csname ap@naam\theap@curnaam taken\endcsname}%
          % Definieer \ap@naamXXtaakXX als de nieuwe taak:
          \global\expandafter\def\csname ap@naam\theap@curnaam taak\theap@tmp\endcsname{%
						\ifthenelse{\equal{#1}{##1}}{%
							\l@ap{#2}{#3}
						}{%
							\l@ap{+ \verwijdern@@m{#1}{##1}: #2}{#3}
						}
          }%
          % Hoog het aantal eerdere taken op:
          \stepcounter{ap@tmp}%
          \global\expandafter\edef\csname ap@naam\theap@curnaam taken\endcsname{\theap@tmp}%

          % Onthoud dat deze naam al bestond:
          \setboolean{ap@gebakt}{true}%
        }{%
          % niks
        }%
        \stepcounter{ap@curnaam}%
      }%
      % Als de naam niet gevonden is, moeten we hem als nieuwe naam definieren:
      \ifthenelse{\boolean{ap@gebakt}}{%
      }{%
        % Initialiseer naam, aantal taken (1) en de eerste taak:
        \global\expandafter\def\csname ap@naam\theap@namen\endcsname{##1}%
        \global\expandafter\edef\csname ap@naam\theap@namen taken\endcsname{1}%
        \global\expandafter\def\csname ap@naam\theap@namen taak0\endcsname{%
					\ifthenelse{\equal{#1}{##1}}{%
						\l@ap{#2}{#3}
					}{%
						\l@ap{+ \verwijdern@@m{#1}{##1}: #2}{#3}
					}
				}%
        % Het totaal aantal namen++
        \stepcounter{ap@namen}%
      }%
    \fi
    \next@@}%
  % splits #1 op komma's
  \expandafter\splitn@@m#1, \relax,%
}%

\newcommand*{\l@ap}{\@dottedtocline{1}{1.5em}{2.3em}}

% Gebruikerscommando voor een actiepunt.


\newcommand{\ap}[2]{
\ifnotulen@stiekemext
\addtocounter{level}{-1}
\ifnum \thelevel < \thestiekemext@huidigniveau
\addtocounter{level}{1}
\par
  \@inaplijsttrue
  \ifeng@art\textbf{Assigned task:}\else\textbf{Actiepunt:}\fi
  \hspace{0.5mm} \naam{#1} #2
  \addtocontents{loa}{\protect\@actiepunt{#1}{{\color{niveau\thestiekemext@huidigniveau}#2}}{\thepage}}
  \@inaplijstfalse
\addtocounter{level}{-1}
\fi
\addtocounter{level}{1}
\else
\par
  \@inaplijsttrue
  \ifeng@art\textbf{Assigned task:}\else\textbf{Actiepunt:}\fi
  \hspace{0.5mm} \naam{#1} #2
  \addtocontents{loa}{\protect\@actiepunt{#1}{#2}{\thepage}}
  \@inaplijstfalse
\fi
}






% ap shortcuts: % gemaakt door Sjoerd Timmer @ 11-10-2012
\newif\if@inaplijst
\newcommand\korteapnaam[2]{%
  \ifcsname#1\endcsname%
    \PackageError{notulen}{Het commando #1 bestaat al!}{Het commando #1 bestaat al!}%
  \fi%
  \expandafter\newcommand\csname #1\endcsname{%
    \if@inaplijst%
      #2\xspace%
    \else%
      \mbox{\naam{#2}}\xspace%
    \fi%
  }%
}


% Actiepuntenlijst; platte lijst.
\newcommand\aplijst{%
  \global\def\@actiepunt##1##2{\contentsline{ap}{\naam{##1} ##2}}%
  \ap@maakaplijst%
}

% Hulpstukken voor \aplijstpp.
\newcounter{ap@namen}
\newcounter{ap@curnaam}
\newcounter{ap@tmp}
\newboolean{ap@gebakt}

% Actiepuntenlijst; gegroepeerd per persoon.
\newcommand\aplijstpp{%
    \aplijstentry
    \section*{\aplijstnaam
      \@mkboth{\MakeUppercase\aplijstnaam}%
              {\MakeUppercase\aplijstnaam}}%
    %
    % Elk actiepunt gaat in volgorde van opgave hierdoorheen.
    \setcounter{ap@namen}{0}%
    %
    % Laad de loa-file en haal die door \@actiepunt:
    \@starttoc{loa}%
    %
    \setcounter{ap@curnaam}{0}%
    % Loop alle gevonden namen af:
    \whiledo{\theap@curnaam < \theap@namen}{%
      % Print naam:
      \naam{\csname ap@naam\theap@curnaam\endcsname}

      \setcounter{ap@tmp}{0}
      % Loop alle taken van deze persoon af:
      \whiledo{\theap@tmp < \csname ap@naam\theap@curnaam taken\endcsname}{%
        % Print opgeslagen taak:
        \csname ap@naam\theap@curnaam taak\theap@tmp\endcsname
        \stepcounter{ap@tmp}
      }%
      \stepcounter{ap@curnaam}%
    }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\not@titel}   {Notulen \message{Waarschuwing: geen titel ingevoerd}}
\newcommand{\not@datum}   {\today  \message{Waarschuwing: geen datum ingevoerd}}
\newcommand{\not@aanwezig}{}
\newcommand{\not@afwezig}{}



\newcommand{\naamzet}{
\ifthenelse{\equal{\not@afwezig}{}}%
{\parbox[c]{\textwidth}{\centering \not@aanwezig}}%
{\parbox[c]{\textwidth}{\centering \not@aanwezig}
 \parbox[c]{\textwidth}{~\newline \centering \ifeng@art absent: \else afwezig: \fi \not@afwezig}}
}

\newcommand{\titel}[1]{
  \renewcommand{\not@titel}{#1}
  \title{#1}
}

\newcommand{\datum}[1]{
  \renewcommand{\not@datum}{#1}
  \date{#1}
}

\newcommand{\aanwezig}[1]{
  \ifeng@art\renewcommand{\not@aanwezig}{present: #1}
  \else
  \renewcommand{\not@aanwezig}{aanwezig: #1}
  \fi
}

\newcommand{\afwezig}[1]{
  \renewcommand{\not@afwezig}{#1}
}

\ifeng@art
\newcommand{\wvttk}{Any Other Business}
\else
\newcommand{\wvttk}{\textsc{w.v.t.t.k.}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Hieronder wordt de definitie van maketitle aangepast. Dit wordt gedaan om op te plaats waar voorheen  author terechtkwam nu de aanwezigen en afwezigen te plaatsen.
\makeatletter
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par ~\newline \naamzet }% Hier stond de author en staan nu dus de af en aanwezigen.
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\newcommand{\nameshape}{\slshape}

\newcommand{\naam}[1]{{\nameshape #1}}

\renewcommand{\EUR}[1]{\geneuro ~#1}

\newcommand{\opm}[1]{\medskip \footnotesize \emph{#1} \normalsize}

\newcommand{\noitemsep}{\setlength{\itemsep}{-\parskip}}

\endinput
