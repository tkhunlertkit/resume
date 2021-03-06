%% ------------------------------------------------------------------------
%% Copyright 2016 Eric Fritz (eric@eric-fritz.com).
%% ------------------------------------------------------------------------

\ProvidesClass{clean-resume}[2016/04/26 resume class]

\LoadClass{article}

%
% Spacing Definitions

\newcommand{\guttersize}{4cm}
\newcommand{\gutterpadding}{.5cm}
\newcommand{\headerheight}{2.25cm}

%
% Derived Spacing

\newcommand{\ledge}{\dimexpr-\guttersize+\gutterpadding}
\newcommand{\gsize}{\dimexpr\guttersize-\gutterpadding*2}
\newcommand{\msize}{\dimexpr\paperwidth-\gutterpadding*2}

%
% Imports

\RequirePackage{tikz}
\RequirePackage{tabto}
\RequirePackage{array}
\RequirePackage{bbding}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{parskip}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\RequirePackage[
  left=\guttersize,
  right=1.5cm,
  top=\headerheight,
  bottom=2cm,
  nohead,
  nofoot,
]{geometry}

%
% Colors and Fonts

\definecolor{white}{HTML}{FFFFFF}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{888888}
\definecolor{header}{HTML}{33A3FD}

\newfontfamily\bodyfont[Path=open-sans/]{OpenSans-Regular.ttf}
\newfontfamily\thinfont[Path=open-sans/]{OpenSans-Light.ttf}
\newfontfamily\headingfont[Path=open-sans/]{OpenSans-Bold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[
  Mapping=tex-text,
  Color=gray,
  Path=open-sans/,
  BoldFont={OpenSans-Bold.ttf},
  ItalicFont={OpenSans-LightItalic.ttf},
]{OpenSans-Regular.ttf}

%
% Header Font Sizes
\newcommand{\asize}{40pt}
\newcommand{\bsize}{16pt}
\newcommand{\csize}{9pt}

%
% Basic Layout Overrides

\pagestyle{empty}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {\LARGE\headingfont\color{header} #1}
  \par\vspace{\parskip}
}

%
% Header

\newcommand{\headertext}[3]{
  \fontsize{#2}{#2}\color{#3}{\thinfont #1}
}

\newcommand{\header}[3]{
  \begin{tikzpicture}[remember picture, overlay]
    \tikzset{every node/.style={
      minimum width=\paperwidth
    }}

    \node[
      rectangle,
      fill=header,
      anchor=north,
      minimum height=\headerheight,
    ] (box) at (current page.north) {};

    \node[anchor=north] (a) at (box.north) { \headertext{#1}{\asize}{white}  };
    \node[anchor=north] (b) at (box.south) { \headertext{#2}{\bsize}{header} };
    \node[anchor=south] (c) at (box.south) { \headertext{#3}{\csize}{white}  };
  \end{tikzpicture}
}

%
% Content Commands

\newcommand{\entry}[5]{
  \textbf{#1} \gutter{\thinfont #3} \hfill \soft{#4} \\
  \ifthenelse{\equal{#2}{}}{}{
    {\thinfont\small #2} \\
  }
  #5
}

\newcommand{\shortentry}[3]{
  #1 \gutter{\thinfont #3} \hfill \soft{#2}
}

\newcommand{\task}[1]{
  $\diamond$ #1 \\
}

\newcommand{\soft}[1]{
  {\footnotesize\addfontfeature{Color=lightgray} #1}
}

%
% Internal Commands

\newcommand{\gutter}[1]{
  \tabto*{\ledge}
  \begin{minipage}[t][\parskip][t]{\gsize}
    \begin{flushright}
      #1
    \end{flushright}
  \end{minipage}
}
