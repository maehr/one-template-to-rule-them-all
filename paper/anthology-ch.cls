%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADER METADATA INFORMATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anthology-ch}[Anthology of Computers and the Humanities]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WORK OFF OF THE BASE ARTICLE CLASS
\LoadClass[11pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOAD ALL REQUIRED PACKAGES HERE
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage[
  a4paper,
  top=3cm,
  bottom=3cm,
  left=3cm,
  right=3cm,
  headsep=1.5cm,
  headheight=14pt,
  footskip=1.5cm
]{geometry}
\RequirePackage{graphicx}
\RequirePackage{kvoptions}
%\RequirePackage{times}
%\RequirePackage{ebgaramond}
\RequirePackage{tinos}
%\RequirePackage{librebaskerville}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{xparse}
\RequirePackage[hidelinks]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CREATE A DRAFT OPTION THAT WE SET WHEN THIS IS THE FINAL VERSION
\newif\if@final
\@finalfalse  % Default is not draft mode
\DeclareOption{final}{\@finaltrue}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CUSTOM COLORS FOR THE STYLE
\definecolor{customlink}{HTML}{efb840}
\definecolor{newgray}{rgb}{0.7,0.7,0.7}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMMANDS TO GRAB CUSTOM METADATA PRODUCED IN THE TEX FILE
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\@pubyear}{}
\newcommand{\pubyear}[1]{\renewcommand{\@pubyear}{#1}}
\newcommand{\@pubvolume}{}
\newcommand{\pubvolume}[1]{\renewcommand{\@pubvolume}{#1}}
\newcommand{\@pagestart}{}
\newcommand{\pagestart}[1]{\renewcommand{\@pagestart}{#1}}
\newcommand{\@pageend}{}
\newcommand{\pageend}[1]{\renewcommand{\@pageend}{#1}}
\newcommand{\@conferencename}{}
\newcommand{\conferencename}[1]{\renewcommand{\@conferencename}{#1}}
\newcommand{\@conferenceeditors}{}
\newcommand{\conferenceeditors}[1]{\renewcommand{\@conferenceeditors}{#1}}
\newcommand{\@doi}{}
\newcommand{\doi}[1]{\renewcommand{\@doi}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STORING THE AUTHOR DATA
\newcounter{authorcount}
\setcounter{authorcount}{0}
\def\@authornames{}
\def\@authornamesend{}
\def\@authornamesfull{}

\define@key{author}{orcid}{\def\@currentorcid{#1}}
\setkeys{author}{orcid={}}

\RenewDocumentCommand{\author}{O{} m O{}}{%
  \stepcounter{authorcount}
  \setkeys{author}{#3}  

  \ifnum\value{authorcount}=1
    \def\@authornames{#2}
    \ifx\@currentorcid\@empty
      \def\@authornamesfull{\mbox{#2}\textsuperscript{#1}}
    \else
      \def\@authornamesfull{\mbox{#2}\textsuperscript{#1}~\href{https://orcid.org/\@currentorcid}{\includegraphics[width=8pt]{orcid.png}}}
    \fi
    \def\@authornamesend{\mbox{#2}}
  \else
    \edef\@authornamesend{\@authornames{}, and \mbox{#2}}
    \appto\@authornames{, \mbox{#2}}
    \ifx\@currentorcid\@empty
      \appto\@authornamesfull{, \mbox{#2}\textsuperscript{#1}}
    \else
      \appto\@authornamesfull{, \mbox{#2}\textsuperscript{#1}~\href{https://orcid.org/\@currentorcid}{\includegraphics[width=8pt]{orcid.png}}}
    \fi
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STORING THE AFFILIATION DATA
\newcounter{affilcount}
\setcounter{affilcount}{0}

\newcommand{\affiliation}[2]{%
  \stepcounter{affilcount}

  \ifnum\value{affilcount}=1
    \def\@affillist{\textsuperscript{#1}~#2}
  \else
    \appto\@affillist{\\\textsuperscript{#1}~#2}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SET THE HEADER AND FOOTER; THESE ARE DIFFERENT ON THE FIRST PAGE
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyheadoffset{1.5cm}

\fancypagestyle{main}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
}

\fancypagestyle{firstpage}{
  \fancyhf{} 
  \if@final
    \fancyhead[L]{
      \textbf{\small\textcolor{newgray}{Anthology of Computers and the Humanities, Vol. \@pubvolume}}
    }
  \else
    \fancyhead[L]{
      \textbf{\small\textcolor{newgray}{Anthology of Computers and the Humanities: Under Review}}
    }
  \fi
  \fancyfoot[C]{\thepage}
}

\AtBeginDocument{%
  \thispagestyle{firstpage}
  \suppressfloats[t] 
  \suppressfloats[b]
}

\pagestyle{main}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINE THE FOOTNOTE ON THE FIRST PAGE THAT CONTAINS THE CITATION AND
% THE COPYRIGHT NOTICE ALONG WITH A LINK TO THE CC BY PAGE
\renewcommand\@makefntext[1]{%
\setlength\parindent{1em}%
\noindent
\mbox{\textsuperscript{\@thefnmark}~}{#1}}

\newcommand{\firstpagefootnote}[1]{\gdef\@firstpagefootnote{#1}}

\if@final
  \newcommand{\@firstpagefootnote}{\footnotesize\@authornamesend. ``\@title.'' In:~\textit{\@conferencename}, ed. by \@conferenceeditors. Vol. \@pubvolume. Anthology of Computers and the Humanities. \@pubyear, \@pagestart--\@pageend. \href{https://doi.org/\@doi}{\textbf{\textcolor{customlink}{https://doi.org/\@doi}}}.

  \vspace{0.5em}

  \noindent
  \textcolor{newgray}{© 2025 by the authors. Licensed under \href{https://creativecommons.org/licenses/by/4.0}{Creative Commons Attribution 4.0 International (CC BY 4.0).}}}
\else
  \newcommand{\@firstpagefootnote}{Paper under review.

  \vspace{0.5em}

  \noindent
  \textcolor{newgray}{© 2025 by the authors. Licensed under \href{https://creativecommons.org/licenses/by/4.0}{Creative Commons Attribution 4.0 International (CC BY 4.0).}}}
\fi


\AtBeginDocument{%
  \AtBeginDocument{%
    \begingroup
    \setcounter{page}{\@pagestart}
    \renewcommand{\thefootnote}{} 
    \renewcommand{\footnoterule}{}
    \footnotetext{\hspace{-2pt}\@firstpagefootnote}%
    \endgroup
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES AND TABLES
\captionsetup[table]{labelfont=bf}
\captionsetup[figure]{labelfont=bf}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINE THE ABSTRACT ENVIRONMENT
\renewenvironment{abstract}{%
  \normalsize 
  \begin{center}
    \bfseries Abstract
  \end{center}
  \small
  \quotation\par\noindent\ignorespaces
}{
  {\\\\\textbf{Keywords:} \@keywords}
  \endquotation
  \vspace{1em}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEFINE THE SECTION, SUBSECTION, and SUBSUBSECTION FORMATS
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {1ex \@plus .2ex}%
  {\normalfont\large\bfseries}}

% command to deal with unnumbered sections such as 'References'
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\quad}

\renewcommand{\subsection}{\@startsection{subsection}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}
  {1ex \@plus .2ex}
  {\normalfont\normalsize\bfseries}
}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{1}{\z@}%
  {-1.5ex \@plus -1ex \@minus -.2ex}
  {1ex \@plus .2ex}
  {\normalfont\normalsize\itshape}
}

\renewcommand{\maketitle}{%
  \begin{center}
    {\LARGE \bfseries \@title \par}
    \vspace{1em}
    \if@final
        {\large
          \begingroup
            \@authornamesfull
          \endgroup
        \par}
        \vspace{0.5em}
        \small
        \@affillist
    \else
        {\large Anonymous Submission}
        \vspace{0.5em}
    \fi
  \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BIBLIGRAPHY
\RequirePackage[
  style=numeric,
  giveninits=false,
  sortcites=true,
  backend=biber]{biblatex}
\RequirePackage[american]{babel}
\RequirePackage{csquotes}

% MLA style customizations for biblatex
\DeclareNameAlias{sortname}{family-given}

% Fix the author name format using a simpler approach
\DeclareNameFormat{author}{%
  \ifgiveninits
    {\usebibmacro{name:family-given}
      {\namepartfamily}
      {\namepartgiveni}
      {\namepartprefix}
      {\namepartsuffix}}
    {\usebibmacro{name:family-given}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  \usebibmacro{name:andothers}}

% Format titles according to MLA
\DeclareFieldFormat{title}{\mkbibquote{#1\isdot}}
\DeclareFieldFormat[article]{title}{\mkbibquote{#1\isdot}}
\DeclareFieldFormat[book]{title}{\mkbibemph{#1\isdot}}
\DeclareFieldFormat[thesis]{title}{\mkbibemph{#1\isdot}}
\DeclareFieldFormat[webpage]{title}{\mkbibquote{#1\isdot}}

% Add periods after author names
\renewcommand*{\revsdnamepunct}{\addcomma\space}

% Format journal titles in italics
\DeclareFieldFormat[article]{journaltitle}{\mkbibemph{#1}}

% Format volume and issue numbers according to MLA
\DeclareFieldFormat[article]{volume}{\mkbibemph{#1}}
\DeclareFieldFormat[article]{number}{, no. #1}

% Add period at the end of each entry
\renewbibmacro*{finentry}{\finentry\addperiod}

\DefineBibliographyStrings{english}{%
  editor = {edited by},
  editors = {edited by},
}

\renewbibmacro*{byeditor+others}{%
  \ifnameundef{editor}
    {}
    {\setunit{\addcomma\space}% Changed from \newunit\newblock
     \usebibmacro{byeditor}%
     \clearname{editor}%
     \newunit}%
  \usebibmacro{byeditorx}%
  \usebibmacro{bytranslator+others}}

\endinput
