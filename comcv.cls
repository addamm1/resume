%% comcv.cls
%% Copyright 2021 Avinal Kumar (https://github.com/avinal)
% Check updated version at https://github.com/avinal/resume
% 
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

% class options 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{comcv}[2021/01/21 Compact CV]

\newif\ifextended
\extendedfalse
\DeclareOption{extended}{
    \extendedtrue
}

\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


% required packages - put more packages here
\RequirePackage[top=0.5cm,left=1cm,right=1cm,bottom=1.2cm]{geometry} % Change Horizontal and Vertical margins
\RequirePackage{fontawesome} % fontawesome icons
\RequirePackage[usenames,dvipsnames]{xcolor} % custom colors
\RequirePackage{fontspec} % custom fonts
\RequirePackage{array}
\RequirePackage{fancyhdr} % fancy header, footer
\RequirePackage{titlesec} % formating sections, subsections
\RequirePackage{hyperref} % for links and, please keep it as last package, add more packages above it
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}
% define your colors here
\definecolor{white}{HTML}{FFFFFF} % color white
\definecolor{gray}{HTML}{555555} % color gray
\definecolor{lightgray}{HTML}{999999} % color light gray, a shade of gray
\definecolor{black}{HTML}{000000} % color black, also gray just deeper
\definecolor{blue}{HTML}{0000ff} % color coral pink, ever seen a real coral, huh 

% provide colors to your elements
\colorlet{defaulttext}{black} % default text color
\colorlet{regulartext}{black} % regular text color
\colorlet{headertext}{black} % header text color
\colorlet{linktext}{blue} % link text volor
\colorlet{lighttext}{lightgray} % light text color

% hyperref options for generating pdf, metadata
\hypersetup{
    colorlinks=false,
    allcolors=linktext
}

% font options
\setmainfont[
    Path=fonts/,
    BoldFont=Roboto-Bold.ttf,
    ItalicFont=Roboto-Italic.ttf,
    BoldItalicFont=Roboto-BoldItalic.ttf,
    Color=regulartext
]{Roboto-Light.ttf}

\newfontfamily\regular[
    Path = fonts/, 
    Color=regulartext
]{Roboto-Regular.ttf}

\newfontfamily\light[
    Path = fonts/, 
    Color=regulartext
]{Roboto-Light.ttf}

\newfontfamily\thin[
    Path = fonts/, 
    Color=defaulttext
]{Roboto-Thin.ttf}

\newfontfamily\regularheader[
    Path = fonts/, 
    Color=headertext
]{Roboto-Regular.ttf}

\newfontfamily\thinheader[
    Path = fonts/, 
    Color=headertext
]{Roboto-Thin.ttf}

\newfontfamily\mediumheader[
    Path = fonts/,
    Color=headertext
]{Roboto-Medium.ttf}


% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}

% define document commands/variables
\newcommand*{\fullname}[3]{\def\comcv@firstname{#1}\def\comcv@lastname{#2}\def\comcv@degree{#3}} % full name and degree

\newcommand*{\cvtitle}[1]{\def\comcv@title{#1}} % title of the document

\newcommand*{\phone}[2]{\def\comcv@phoneurl{#1}\def\comcv@phonetext{#2}} % phone

\newcommand*{\email}[1]{\def\comcv@mailid{#1}} % email id and email text

\newcommand*{\website}[2]{\def\comcv@websiteurl{#1}\def\comcv@websitetext{#2}} % website and website text

\newcommand*{\github}[2]{\def\comcv@githuburl{#1}\def\comcv@githubtext{#2}} % github

\newcommand*{\linkedin}[2]{\def\comcv@linkedinurl{#1}\def\comcv@linkedintext{#2}} % linkedin



\newcommand\horbar[1][]{\noindent\makebox[\linewidth]{\color{gray}\rule{\paperwidth}{0.4pt}}} % unindented horizontal line



% link colors
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=linktext}}

% redefining some commands
\titlespacing{\section}{0pt}{0pt}{0pt} % remove space around sections
\titleformat{\section}{
    \fontsize{14pt}{16pt}\thinheader\bfseries\uppercase 
}{}{0pt}{}



\titlespacing{\subsection}{0pt}{0pt}{0pt} % remove space around subsection
\titleformat{\subsection}[runin]{ % runin option let you put text side of section or subsection
    \fontsize{12pt}{12pt}\mediumheader\bfseries
}{}{0pt}{}

% new command for writing subsection and descriptions
\newcommand{\combosection}[4]{
    \subsection{\textbf{#1}}
    \ifx&#2&
    \else
    \Large\addfontfeatures{Color=linktext}{~|}
    \light\large{#2}
    \fi
    \hfill{#3}
    \linebreak
    \normalsize{#4}
}

% header
\AtBeginDocument{
    % hyperref options
    \hypersetup{
        pdfauthor={\comcv@firstname~\comcv@lastname}, % author of the file
        pdftitle={\comcv@firstname~\comcv@lastname's Résumé}, % title for the generated pdf
    }
    
    \ifdefined\comcv@phoneurl
    \ifx\comcv@phoneurl\empty
        \def\comcv@phone{}
    \else
        \def\comcv@phone{\faPhone~\href{\comcv@phoneurl}{\comcv@phonetext}}
    \fi
    \else
        \def\comcv@phone{}
    \fi
    
    \def\comcv@email{\faEnvelope~\href{mailto:\comcv@mailid}{\comcv@mailid}}
    
    \ifdefined\comcv@linkedinurl
    \ifx\comcv@linkedinurl\empty
        \def\comcv@linkedin{}
    \else
        \def\comcv@linkedin{\faLinkedin~\href{\comcv@linkedinurl}{\comcv@linkedintext}}
    \fi
    \else
        \def\comcv@linkedin{}
    \fi
    
    \ifdefined\comcv@githuburl
    \ifx\comcv@githuburl\empty
        \def\comcv@github{}
    \else
        \def\comcv@github{\faGithub~\href{\comcv@githuburl}{\comcv@githubtext}}
    \fi
    \else
        \def\comcv@github{}
    \fi
    
    \ifdefined\comcv@websiteurl
    \ifx\comcv@websiteurl\empty
        \def\comcv@website{}
    \else
        \def\comcv@website{\faGlobe~\href{\comcv@websiteurl}{\comcv@websitetext}}
    \fi
    \else
        \def\comcv@website{}
    \fi
    

    \begin{center}
        % define your header text size, color and format
        \fontsize{35pt}{45pt}\thinheader\comcv@firstname~\regularheader\comcv@lastname
        \ifx\comcv@degree\empty% do nothing in case of empty degree
        \else
            \thinheader,~\comcv@degree
        \fi

        \ifdefined\comcv@title
        \ifx\comcv@title\empty
            \large\light\comcv@phone~~\comcv@email~~\comcv@linkedin
            \vspace{-\topsep}
            \horbar
            \vspace{-\topsep}
        \else
            \large\light\comcv@title
            \vspace{-\topsep}
            \horbar

            \comcv@phone~~\comcv@email~~\comcv@linkedin
            \vspace{-\topsep}
        \fi
        \else
            \large\light\comcv@phone~~\comcv@email~~\comcv@linkedin
            \vspace{-\topsep}
            \horbar
            \vspace{-\topsep}
        \fi
        %  \comcv@website~~\comcv@github~ was removed from above between email and linkedin, add back in to allow website and github
    \end{center}
}

% footer
\newcommand*{\currentdate}[1]{\def\comcv@date{#1}}
\def\comcv@totpages{~/~\regular\ref{TotPages}}
\def\comcv@page{\light{Page~}\thepage\comcv@totpages}

\AtBeginDocument{
    \pagestyle{fancy}
    \fancyhead{}
    \fancyfoot[C]{\footnotesize\light\comcv@firstname's Résumé, \comcv@date, \comcv@email} % footer text
    \renewcommand{\headrulewidth}{0em}
    \setlength\footskip{\baselineskip}
}

\newenvironment{tightlist}{
    \vspace{-6mm}
    \begin{itemize}
        \itemsep1pt
        \parskip0pt
        \parsep0pt
}{
    \end{itemize}
}
