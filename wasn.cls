%%======== Package options and base class ========
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wasn}
\LoadClassWithOptions{article}
\pdfoutput=1

%%======== Page layout ========
\RequirePackage[
    top=2.75cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm,
    columnsep=0.65cm,
]{geometry}
\RequirePackage{microtype}
\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage[latin, english]{babel}
\RequirePackage{lipsum}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{ulem}
\DisableLigatures[f]{family=sf*}

%%======== Math symbols, graphics, and tables ========
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{mathtools}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{nicematrix}
\RequirePackage{multirow}
\RequirePackage{bm}
\newcommand{\nm}[1]{#1}

%%======== Colors and boxes ========
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}
\definecolor{wasnbg}{HTML}{0D2899}
\definecolor{wasnblue}{HTML}{0D2899}
\newcommand{\wasnblue}[1]{{\bfseries\color[HTML]{0D2899} #1}}

%%======== Table of contents style ========
\RequirePackage[subfigure]{tocloft}
\RequirePackage{parskip}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecfont}{\sffamily\bfseries}
\renewcommand{\cftsecpagefont}{\sffamily\bfseries}{\color{wasnblue}}
\renewcommand{\cfttoctitlefont}{\sffamily\sectionfont\wasnblue}

%%======== Hyperlinks and cross references ========
\RequirePackage{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=wasnblue,
  citecolor=wasnblue,
  urlcolor=wasnblue
}

%%======== Bibliography (BibTeX + natbib) ========
\RequirePackage[numbers, sort&compress]{natbib}
\def\bibfont{\small}
\addto{\captionsenglish}{\renewcommand{\refname}{References}}
\newcommand{\citeas}[1]{\Needspace*{8\baselineskip}\noindent\bibentry{#1}}

%%======== Section and caption format ========
\newcommand{\sectionfont}{\fontsize{12}{10}\selectfont}
\newcommand{\subsectionfont}{\fontsize{11}{10}\selectfont}

\RequirePackage{titlesec}
\titleformat*{\paragraph}{\itshape}
\titleformat*{\section}{\sectionfont\sffamily\bfseries\wasnblue}
\titleformat*{\subsection}{\subsectionfont\sffamily\bfseries\wasnblue}
% First, second, and third level headings use sizes 12, 11, and 10 respectively.
\titleformat*{\subsubsection}{\normalsize\sffamily\bfseries\wasnblue}

\newcommand{\bffont}{\fontsize{8.8}{10}\selectfont}
\DeclareTextFontCommand{\textbf}{\bffont\bfseries\sffamily}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{}
\DeclareCaptionFormat{custom}{{\sffamily\textbf{#1 #2}} #3}
\captionsetup{singlelinecheck=true,format=custom,labelsep=custom,font=small}
\captionsetup[sub]{singlelinecheck=true,format=custom,labelsep=custom,font=small}

%%======== Fonts (Geist Sans / Geist Mono / Latin Modern) ========
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

\DeclareFontFamily{T1}{geistsans}{}
\DeclareFontShape{T1}{geistsans}{ul}{n}{<-> s*[1] fonts/geistsans/geistsans_thin}      {}% Thin
\DeclareFontShape{T1}{geistsans}{el}{n}{<-> s*[1] fonts/geistsans/geistsans_extralight}{}% ExtraLight
\DeclareFontShape{T1}{geistsans}{l} {n}{<-> s*[1] fonts/geistsans/geistsans_light}     {}% Light
\DeclareFontShape{T1}{geistsans}{m} {n}{<-> s*[1] fonts/geistsans/geistsans_regular}   {}% Regular
\DeclareFontShape{T1}{geistsans}{mb}{n}{<-> s*[1] fonts/geistsans/geistsans_medium}    {}% Medium
\DeclareFontShape{T1}{geistsans}{sb}{n}{<-> s*[1] fonts/geistsans/geistsans_semibold}  {}% SemiBold
\DeclareFontShape{T1}{geistsans}{b} {n}{<-> s*[1] fonts/geistsans/geistsans_bold}      {}% Bold
\DeclareFontShape{T1}{geistsans}{bx}{n}{<-> s*[1] fonts/geistsans/geistsans_bold}      {}% \bfseries
\DeclareFontShape{T1}{geistsans}{eb}{n}{<-> s*[1] fonts/geistsans/geistsans_extrabold} {}% ExtraBold
\DeclareFontShape{T1}{geistsans}{ub}{n}{<-> s*[1] fonts/geistsans/geistsans_black}     {}% Black

\pdfmapline{+geistsans_thin       < fonts/geistsans/Geist-Thin.ttf       <T1-WGL4.enc}
\pdfmapline{+geistsans_extralight < fonts/geistsans/Geist-ExtraLight.ttf <T1-WGL4.enc}
\pdfmapline{+geistsans_light      < fonts/geistsans/Geist-Light.ttf      <T1-WGL4.enc}
\pdfmapline{+geistsans_regular    < fonts/geistsans/Geist-Regular.ttf    <T1-WGL4.enc}
\pdfmapline{+geistsans_medium     < fonts/geistsans/Geist-Medium.ttf     <T1-WGL4.enc}
\pdfmapline{+geistsans_semibold   < fonts/geistsans/Geist-SemiBold.ttf   <T1-WGL4.enc}
\pdfmapline{+geistsans_bold       < fonts/geistsans/Geist-Bold.ttf       <T1-WGL4.enc}
\pdfmapline{+geistsans_extrabold  < fonts/geistsans/Geist-ExtraBold.ttf  <T1-WGL4.enc}
\pdfmapline{+geistsans_black      < fonts/geistsans/Geist-Black.ttf      <T1-WGL4.enc}

\DeclareFontFamily{T1}{geistmono}{}
\DeclareFontShape{T1}{geistmono}{ul}{n}{<-> s*[1] fonts/geistmono/geistmono_thin}      {}% Thin
\DeclareFontShape{T1}{geistmono}{el}{n}{<-> s*[1] fonts/geistmono/geistmono_extralight}{}% ExtraLight
\DeclareFontShape{T1}{geistmono}{l} {n}{<-> s*[1] fonts/geistmono/geistmono_light}     {}% Light
\DeclareFontShape{T1}{geistmono}{m} {n}{<-> s*[1] fonts/geistmono/geistmono_regular}   {}% Regular
\DeclareFontShape{T1}{geistmono}{mb}{n}{<-> s*[1] fonts/geistmono/geistmono_medium}    {}% Medium
\DeclareFontShape{T1}{geistmono}{sb}{n}{<-> s*[1] fonts/geistmono/geistmono_semibold}  {}% SemiBold
\DeclareFontShape{T1}{geistmono}{b} {n}{<-> s*[1] fonts/geistmono/geistmono_bold}      {}% Bold
\DeclareFontShape{T1}{geistmono}{bx}{n}{<-> s*[1] fonts/geistmono/geistmono_bold}      {}% \bfseries
\DeclareFontShape{T1}{geistmono}{eb}{n}{<-> s*[1] fonts/geistmono/geistmono_extrabold} {}% ExtraBold
\DeclareFontShape{T1}{geistmono}{ub}{n}{<-> s*[1] fonts/geistmono/geistmono_black}     {}% Black

\pdfmapline{+geistmono_thin       < fonts/geistmono/GeistMono-Thin.ttf       <T1-WGL4.enc}
\pdfmapline{+geistmono_extralight < fonts/geistmono/GeistMono-ExtraLight.ttf <T1-WGL4.enc}
\pdfmapline{+geistmono_light      < fonts/geistmono/GeistMono-Light.ttf      <T1-WGL4.enc}
\pdfmapline{+geistmono_regular    < fonts/geistmono/GeistMono-Regular.ttf    <T1-WGL4.enc}
\pdfmapline{+geistmono_medium     < fonts/geistmono/GeistMono-Medium.ttf     <T1-WGL4.enc}
\pdfmapline{+geistmono_semibold   < fonts/geistmono/GeistMono-SemiBold.ttf   <T1-WGL4.enc}
\pdfmapline{+geistmono_bold       < fonts/geistmono/GeistMono-Bold.ttf       <T1-WGL4.enc}
\pdfmapline{+geistmono_extrabold  < fonts/geistmono/GeistMono-ExtraBold.ttf  <T1-WGL4.enc}
\pdfmapline{+geistmono_black      < fonts/geistmono/GeistMono-Black.ttf      <T1-WGL4.enc}

\renewcommand{\sfdefault}{geistsans}% Geist Sans
\renewcommand{\ttdefault}{geistmono}% Geist Mono
\renewcommand{\rmdefault}{lmr}      % Latin Modern

%%======== Authors, affiliations, and metadata ========
\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand{\authorfont}{\fontsize{12}{14}\selectfont}
\newcommand\authorlist{}
\newcommand\authorformat[2][]{\authorfont{\sffamily\bfseries #2$^{#1}$}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{, }}

\newcommand{\affiliationfont}{\fontsize{10}{12}\selectfont}
\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{
    {\affiliationfont{\fontfamily{geistsans}\fontseries{mb}\selectfont $^{#1}$#2}}
}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{, }}

\newcommand{\contributionfont}{\fontsize{10}{12}\selectfont}
\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{{\contributionfont $^{#1}$#2}}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{, }}

\newcommand{\checkdatafont}{\fontsize{7.92}{10}\selectfont}
\newcommand\checkdatalist{}
\newcommand\checkdataformat[2][]{{\small {\checkdatafont\sffamily \bfseries #1:} #2}}
\newcommand\checkdata[2][]{\addtolist[#1]{#2}{\checkdatalist}{\checkdataformat}{\par}}

\newcommand{\abstractinfont}{\fontsize{10}{12}\selectfont}
\renewcommand{\abstract}[1]{\def\abstractlist{{\abstractinfont #1}}}

\AtBeginDocument{\urlstyle{tt}}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\codeurl}[1]{\href{#1}{\nolinkurl{#1}}}
\newcommand{\codelink}[1]{\checkdata[Code]{\codeurl{#1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\renewcommand\date[1]{\checkdata[Date]{#1}}
\newcommand\correspondence[1]{\checkdata[Correspondence]{#1}}

\newcommand{\titlefont}{\fontsize{17}{20}\selectfont}
\renewcommand{\title}[1]{\newcommand{\titlelist}{\titlefont{\sffamily\bfseries #1}}}

\newcommand{\abstractfont}{\fontsize{12}{12}\selectfont}
\newcommand{\beginabstract}{\abstractfont{\sffamily\bfseries \wasnblue{Abstract}\par}}
\newcommand{\beginappendix}{\appendix{\titlefont\sffamily \wasnblue{Appendix}\par}}

%%======== Header and footer ========
\RequirePackage{tikz}
\fancypagestyle{firststyle}{
    \fancyhf{}
    \fancyhead[L]{%
        \begin{tikzpicture}[remember picture, overlay]
            \node[anchor=north west]
                at ([xshift=2.5cm, yshift=-1.7cm]current page.north west) {%
                \includegraphics[width=33.0mm, height=9mm]{assets/logo_wasn.png}%
            };
        \end{tikzpicture}%
    }
}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%%======== Rules for the title box on the first page ========
% Horizontal rules on both sides of the title: 0.5pt thick, 160mm long.
\newcommand{\@toptitlebar}{
  \wasnblue{\hrule height 0.5pt }
  \vskip 6mm
}
\newcommand{\@bottomtitlebar}{
  \vskip 6mm
  \wasnblue{\hrule height 0.5pt}
}

%%======== Title box ========
\newcommand{\mymaketitle}{%
  \tcbset{enhanced}
  \tcbset{left=8mm}
  \tcbset{right=8mm}
  \tcbset{top=6mm}
  \tcbset{bottom=6mm}
  \tcbset{colback=white}
  \tcbset{colframe=wasnbg}
  \tcbset{boxrule=0.5pt}
  \tcbset{before skip=0pt}
  \tcbset{grow to left by=1.5pt}
  \tcbset{grow to right by=1.5pt}
      {
      \setlength{\parskip}{0mm}
      \centering
      \nohyphens
      %
      {
      \@toptitlebar
        \titlelist\par
         \@bottomtitlebar
      }
      \vskip 6mm
      \authorlist
      \vskip 3mm
      %
      \affiliationlist\par
      \vskip 3mm
      %
      \contributionlist\par
    }
   \vskip 6mm

  \begin{tcolorbox}
    \setlength{\parindent}{0cm}
    \setlength{\parskip}{0cm}
    %
    \begin{center}
        \beginabstract
        \vskip 3mm
    \end{center}
    \abstractlist\par
    %
    \vskip 3mm
    %
    {
      \setlength{\parskip}{0cm}
      \ifdefempty{\checkdatalist}{\vspace*{0.65cm}}{\checkdatalist\par}
    }
  \end{tcolorbox}
  \tcbset{reset}
  \FloatBarrier

  \thispagestyle{firststyle}
}

\if@twocolumn%
\renewcommand{\maketitle}{
\twocolumn[%
 \vskip 3mm
  \mymaketitle
  \vskip 8mm
]
}%
\else%
\renewcommand{\maketitle}{
  \mymaketitle
  \vskip 8mm
}%
\fi
