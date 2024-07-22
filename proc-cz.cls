\ProvidesClass{proc-cz}

\LoadClass[a4paper,12pt]{article}

% When using Xelatex
% Xelatex is generating .log file defaultly in UTF-8
%\usepackage{fontspec}

\usepackage{lipsum} % For dummy text

% Czech coding (remove when using english) 
% This changes also names of conclusion, etc...
\RequirePackage[czech]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Basic packages
\RequirePackage{float}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{commath}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{mathabx}
\RequirePackage{enumitem}
\RequirePackage{svg}
\RequirePackage{wrapfig}
\RequirePackage{siunitx}
\RequirePackage{colortbl}

% Color of references:
%\RequirePackage{hyperref}
\RequirePackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

\RequirePackage{booktabs}
\RequirePackage{calc}

\RequirePackage{array}
\RequirePackage{tocloft}

\RequirePackage{adjustbox}

% Takes figures from this folder
\graphicspath{{figures_folder/}}

% Glossaries
% When using old glossaries:
%\RequirePackage[acronym]{glossaries}

% Glossaries-extra were used for automatic sorting 
% Name of file with glossaries should be gls_entry.bib
\usepackage[record,% using bib2gls
  nogroupskip,style=super]{glossaries-extra}
\newglossary*{gls_entry}{Seznam označení}

\GlsXtrLoadResources[
  src={gls_entry},% entries in the file 'gls_entry.bib'
  sort={letter-nocase},
  type={gls_entry},% put the entries in the 'gls_entry' glossary
  save-locations=false% the location lists aren't required
]

% setting glossarie style
\newlength\glsnamewidth
\newlength\glsunitwidth

\settowidth{\glsnamewidth}{\textbf{Označení}}
\settowidth{\glsunitwidth}{\textbf{Jedntoky}}

\newglossarystyle{namedescunit}{%
  \setlength{\glsdescwidth}{\linewidth-\glsnamewidth-\glsunitwidth-6\tabcolsep}%
  \renewenvironment{theglossary}%
    {\begin{longtable}{p{\glsnamewidth}p{\glsdescwidth}p{\glsunitwidth}}}%
    {\end{longtable}}%
 \renewcommand*{\glossaryheader}{%
    \bfseries Označení
   & \bfseries Popis
   & \bfseries Jednotky
   \tabularnewline
   \midrule
   \tabularnewline\endhead}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{%
    \glstarget{##1}{\glossentryname{##1}} &
    \glossentrydesc{##1} &
    \glossentrysymbol{##1}\tabularnewline
  }%
  \renewcommand{\subglossentry}[3]{\glossentry{##2}{##3}}%
  \renewcommand*{\glsgroupskip}{}%
}
\setglossarystyle{namedescunit}

\RequirePackage{pdflscape}

%biblatex
\RequirePackage[backend=bibtex,style=numeric]{biblatex}
% \bibliographystyle{abbrv}

%hyphenation
\RequirePackage{hyphenat}

% smaller caption font
\RequirePackage[font={small,it}]{caption}

%subfloat package
\RequirePackage{subfig}

% Header
\RequirePackage{fancyhdr}
% Define the fancy header
\fancypagestyle{myfancy}{
  \fancyhf{}
  \fancyhead[L]{\nouppercase{\leftmark}}  % Current section title on the left
  \fancyhead[R]{\nouppercase{\rightmark}} % Current subsection title on the right
  \fancyfoot[C]{\hfill\thepage\hfill}   % Page number in the center of the footer
  \renewcommand{\headrulewidth}{0.4pt} % Set header rule width
}
% Define a plain page style for the glossary
\fancypagestyle{plainstyle}{
  \fancyhf{} % Clear header and footer
  \fancyfoot[C]{\thepage} % Only page number in footer
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
}
% Redefine subsection mark to include subsection in the header
\renewcommand{\subsectionmark}[1]{\markright{#1}} 

% Change captions etc.
\renewcommand{\tablename}{Tab.}
\renewcommand{\figurename}{Obr.}
\renewcommand{\contentsname}{Obsah}
\renewcommand{\listfigurename}{Seznam obrázků}
\renewcommand{\listtablename}{Seznam tabulek}
\renewcommand{\cftfigpresnum}{Obr. }
\renewcommand{\cftfignumwidth}{4em}
\renewcommand{\cfttabpresnum}{Tab. }
\renewcommand{\cfttabnumwidth}{4em}

% New LaTex commands
\newcommand{\sectionbreak}{\clearpage}
\newcommand{\doi}[1]{\href{http://dx.doi.org/#1}{doi:~#1}}

% numbering of equation by section
\numberwithin{equation}{section}



