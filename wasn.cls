%%======== Pckage options and base class ========
%\newboolean{logo}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wasn}
\LoadClassWithOptions{article}
\pdfoutput=1

% Layout 
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
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{ulem}  % 引用下划线
\DisableLigatures[f]{family=sf*} 
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{nicematrix}
\RequirePackage{multirow}
\RequirePackage{bm}
\newcommand{\nm}[1]{#1}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}
\definecolor{wasnbg}{HTML}{50B0DE}
\definecolor{wasnblue}{HTML}{50B0DE}
\newcommand{\wasnblue}[1]{{\bfseries\color[HTML]{50B0DE} #1}} 

% References %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[subfigure]{tocloft}
\RequirePackage{parskip}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecfont}{\sffamily\bfseries}
\renewcommand{\cftsecpagefont}{\sffamily\bfseries}{\color{wasnblue}}
\renewcommand{\cfttoctitlefont}
{\sffamily\sectionfont\wasnblue}

\RequirePackage{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=wasnblue,
  citecolor=wasnblue,
  urlcolor=wasnblue
}

\RequirePackage[numbers, sort&compress]{natbib}
%\RequirePackage[round,authoryear]{natbib}
\def\bibfont{\small}

%%========  Bibliography using bibtex ========
\addto{\captionsenglish}{\renewcommand{\refname}{References}}
\newcommand{\citeas}[1]{\Needspace*{8\baselineskip}\noindent\bibentry{#1}}

% Section and caption format 
\newcommand{\sectionfont}
{\fontsize{12}{10}\selectfont} 

\newcommand{\subsectionfont}
{\fontsize{11}{10}\selectfont} 

\RequirePackage{titlesec}
\titleformat*{\paragraph}{\itshape}
\titleformat*{\section}{\sectionfont\sffamily\bfseries\wasnblue}
\titleformat*{\subsection}{\subsectionfont\sffamily\bfseries\wasnblue}


% 一级二级三级标题分别用 12 11 10
\titleformat*{\subsubsection}{\normalsize\sffamily\bfseries\wasnblue}

\newcommand{\bffont}
{\fontsize{8.8}{10}\selectfont} 

\DeclareTextFontCommand{\textbf}{\bffont\bfseries\sffamily}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{}
\DeclareCaptionFormat{custom}{{\sffamily\textbf{#1 #2}} #3}
\captionsetup{singlelinecheck=true,format=custom,labelsep=custom,font=small}
\captionsetup[sub]{singlelinecheck=true,format=custom,labelsep=custom,font=small}

\RequirePackage[T1]{fontenc}
\DeclareFontFamily{T1}{notosans}{}
\DeclareFontShape{T1}{notosans}{ul}{n}{<-> s*[1] fonts/notosans_thin}      {}% Thin
\DeclareFontShape{T1}{notosans}{el}{n}{<-> s*[1] fonts/notosans_extralight}{}% ExtraLight
\DeclareFontShape{T1}{notosans}{l} {n}{<-> s*[1] fonts/notosans_light}     {}% Light
\DeclareFontShape{T1}{notosans}{m} {n}{<-> s*[1] fonts/notosans_regular}   {}% Regular
\DeclareFontShape{T1}{notosans}{mb}{n}{<-> s*[1] fonts/notosans_medium}    {}% Medium
\DeclareFontShape{T1}{notosans}{sb}{n}{<-> s*[1] fonts/notosans_semibold}  {}% SemiBold
\DeclareFontShape{T1}{notosans}{b} {n}{<-> s*[1] fonts/notosans_bold}      {}% Bold
\DeclareFontShape{T1}{notosans}{bx}{n}{<-> s*[1] fonts/notosans_bold}      {}% \bfseries
\DeclareFontShape{T1}{notosans}{eb}{n}{<-> s*[1] fonts/notosans_extrabold} {}% ExtraBold
\DeclareFontShape{T1}{notosans}{ub}{n}{<-> s*[1] fonts/notosans_black}     {}% Black

\pdfmapline{+notosans_thin       < fonts/NotoSans-Thin.ttf       <T1-WGL4.enc}
\pdfmapline{+notosans_extralight < fonts/NotoSans-ExtraLight.ttf <T1-WGL4.enc}
\pdfmapline{+notosans_light      < fonts/NotoSans-Light.ttf      <T1-WGL4.enc}
\pdfmapline{+notosans_regular    < fonts/NotoSans-Regular.ttf    <T1-WGL4.enc}
\pdfmapline{+notosans_medium     < fonts/NotoSans-Medium.ttf     <T1-WGL4.enc}
\pdfmapline{+notosans_semibold   < fonts/NotoSans-SemiBold.ttf   <T1-WGL4.enc}
\pdfmapline{+notosans_bold       < fonts/NotoSans-Bold.ttf       <T1-WGL4.enc}
\pdfmapline{+notosans_extrabold  < fonts/NotoSans-ExtraBold.ttf  <T1-WGL4.enc}
\pdfmapline{+notosans_black      < fonts/NotoSans-Black.ttf      <T1-WGL4.enc}

\renewcommand{\sfdefault}{notosans}%
\renewcommand{\rmdefault}{cmr}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Authors, affiliations, infos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect 
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand{\authorfont}
{\fontsize{12}{14}\selectfont} 

\newcommand\authorlist{}
\newcommand\authorformat[2][]{\authorfont{\sffamily\bfseries #2$^{#1}$}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{, }}

\newcommand{\affiliationfont}
{\fontsize{10}{12}\selectfont}

\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{
    {\affiliationfont{\fontfamily{notosans}\fontseries{mb}\selectfont $^{#1}$#2}}
}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{, }}

\newcommand{\contributionfont}
{\fontsize{10}{12}\selectfont}

\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{{\contributionfont $^{#1}$#2}}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{, }}

\newcommand{\checkdatafont}
{\fontsize{7.92}{10}\selectfont}

\newcommand\checkdatalist{}
\newcommand\checkdataformat[2][]{{\small {\checkdatafont\sffamily \bfseries #1:} #2}}
\newcommand\checkdata[2][]{\addtolist[#1]{#2}{\checkdatalist}{\checkdataformat}{\par}}

\newcommand{\abstractinfont}
{\fontsize{10}{12}\selectfont} 

\renewcommand{\abstract}[1]{\def\abstractlist{{\abstractinfont #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

\renewcommand\date[1]{\checkdata[Date]{#1}}
\newcommand\correspondence[1]{\checkdata[Correspondence]{#1}}

\newcommand{\titlefont}
{\fontsize{17}{20}\selectfont} 

\renewcommand{\title}[1]{\newcommand{\titlelist}{\titlefont{\sffamily\bfseries #1}}}


\newcommand{\abstractfont}
{\fontsize{12}{12}\selectfont} 

\newcommand{\beginabstract}{\abstractfont{\sffamily\bfseries \wasnblue{Abstract}\par}}

\newcommand{\beginappendix}{\appendix{\titlefont\sffamily \wasnblue{Appendix}\par}}

%%======== Header and Footer Content ========

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

% rules for title box at top of first page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%此处为标题两侧线段，0.5pt 长 160mm
\newcommand{\@toptitlebar}{
  \wasnblue{\hrule height 0.5pt }
  \vskip 6mm
  %\vskip -\parskip%
}
\newcommand{\@bottomtitlebar}{
  \vskip 6mm
  %\vskip -\parskip
  \wasnblue{\hrule height 0.5pt}
  %\vskip 0.09in%
}

% Titlebox %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\mymaketitle}{%
  %\tcbset{enhanced,frame hidden}
  \tcbset{enhanced}
  \tcbset{left=8mm}
  \tcbset{right=8mm}
  \tcbset{top=6mm}
  \tcbset{bottom=6mm}
  \tcbset{colback=white}  
  % 框线颜色
  \tcbset{colframe=wasnbg} 
  % 调整框线粗细
  \tcbset{boxrule=0.5pt} 
  \tcbset{before skip=0pt}
  \tcbset{grow to left by=1.5pt}
  \tcbset{grow to right by=1.5pt}
  \tcbset{arc=2.5mm}
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

  %加入页眉页脚
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
  %\setlength{\parskip}{4mm}
}%
\fi
