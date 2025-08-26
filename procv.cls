%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom class file to be used from .tex files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{procv}[2025/08/26 A professional CV template class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands/environments, to be used from .tex file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ------------------------------------------------
% Environment: procv-twocolumns
% Description: Encompasses the entire content, only
%              \begin{document} and \end{document}
%              is outside of this environment
% Usage      : \begin{procv-twocolumns}
%                  <ALL DOCUMENT CONTENT HERE>
%              \end{procv-twocolumns}
% ------------------------------------------------
\newenvironment{procv-twocolumns}
    {
        \setlength{\columnsep}{1.5cm}
        \columnratio{0.29}
        \begin{paracol}{2}
            \backgroundcolor{c[0](10000pt,10000pt)(0.5\columnsep,10000pt)}{sidebarBgColor}
            \flushleft
    }
    {
        \end{paracol}
    }


% ------------------------------------------------
% Command    : \profilepic[1]
% Argument   : #1 filename
% Description: Inserts a profile picture.
% Usage      : \profilepic{profilepicture}
% ------------------------------------------------
\newcommand{\profilepic}[1]{
    \begin{center}
        \begin{tikzpicture}
            \clip (0,0) circle [radius=1.7cm] node {\includegraphics[width=3.4cm]{#1}};
        \end{tikzpicture}
    \end{center}
    }


% ------------------------------------------------
% Command    : \aboutme[2]
% Argument   : #1 Text for section
%              #2 Paragraph text
% Description: Inserts a text section to describe
%              yourself
% Usage      : \aboutme{About Me}{Random text}
% ------------------------------------------------
\newcommand{\aboutme}[2]{
    {\color{sidebarTextColor}
        \section*{#1}
        #2
    }
    \newline
    \separatorline
}


% ------------------------------------------------
% Environment: skills[1]
% Argument   : #1 Text for section
% Description: Starts a skills environment. Supposed
%              to only contain \skillrow commands
% Usage      : \begin{skills}{Languages}
%                  \skillrow{X}{3.7}
%              \end{skills}
% ------------------------------------------------
\newenvironment{skills}[1]
    {
        {\color{sidebarTextColor}
            \section*{#1}
        }
        \begin{tabular}{@{}ll}
    }
    {
        \end{tabular}
        \vspace{6pt}
        \newline
        \separatorline
    }


% ------------------------------------------------
% Command    : \skillrow[2]
% Argument   : #1 Text for skill
%              #2 Skill level for skill, 1-5
% Description: Inserts a row for skill
% Usage      : \skillrow{Python}{4.5}
% ------------------------------------------------
\newcommand{\skillrow}[2]{
    {\color{sidebarTextColor} #1 } & \grade{#2} \\
}    


% ------------------------------------------------
% Command    : \links[2]
% Argument   : #1 Text for section
%              #2 Links to be inserted
% Description: Inserts a row for skill
% Usage      : \skillrow{Python}{4.5}
% ------------------------------------------------
\newcommand{\links}[2]
    {
        {\color{sidebarTextColor}
            \section*{#1}
        }
        #2
        \newline
        \separatorline
    }

% ------------------------------------------------
% Command    : \website[1]
% Argument   : #1 Website url
% Description: Inserts a row for website
% Usage      : \website{google.com}
% ------------------------------------------------
\newcommand{\website}[1]{\link{\faGlobe}{#1}}


% ------------------------------------------------
% Command    : \linkedin[1]
% Argument   : #1 Linkedin url
% Description: Inserts a row for linkedin
% Usage      : \linkedin{linkedin.com/in/xyz}
% ------------------------------------------------
\newcommand{\linkedin}[1]{\link{\faLinkedin}{#1}}


% ------------------------------------------------
% Command    : \github[1]
% Argument   : #1 Github url
% Description: Inserts a row for github
% Usage      : \linkedin{github.com/xyz}
% ------------------------------------------------
\newcommand{\github}[1]{\link{\faGithub}{#1}}


% ------------------------------------------------
% Command    : \references[2]
% Argument   : #1 Text for section
%              #2 Text for paragraph
% Description: Inserts text for references
% Usage      : \references{References}{Random text}
% ------------------------------------------------
\newcommand{\references}[2]{
    {\color{sidebarTextColor}
        \section*{#1}
        #2
    }
    \newline
    \separatorline
}

% ------------------------------------------------
% Environment: personal[1]
% Argument   : #1 Text for section
% Description: Starts a personal environment. Supposed
%              to only contain \detail commands
% Usage      : \begin{personal}{Personal details}
%                  \detail{Nationality}{Swedish}
%              \end{personal}
% ------------------------------------------------
\newenvironment{personal}[1]
    {
        {\color{sidebarTextColor}
            \section*{#1}
        }
        \begin{tabular}{@{}ll}
    }
    {
        \end{tabular}
        \vspace{6pt}
        \newline
        \separatorline
    }


% ------------------------------------------------
% Command    : \detail[2]
% Argument   : #1 Text for detail title
%              #2 Text for detail text
% Description: Inserts row for details
% Usage      : \detail{Nationality}{Swedish}
% ------------------------------------------------
\newcommand{\detail}[2]{
    {\color{sidebarTextColor} #1 } & {\color{sidebarTextColor} #2 } \\
}


% ------------------------------------------------
% Command    : \references[2]
% Argument   : #1 Text for section
%              #2 Text for paragraph
% Description: Inserts text for hobbies
% Usage      : \hobbies{References}{Random text}
% ------------------------------------------------
\newcommand{\hobbies}[2]{
    {\color{sidebarTextColor}
        \section*{#1}
        #2
    }
    \newline
    \separatorline

}


% ------------------------------------------------
% Command    : \header[4]
% Argument   : #1 First name
%              #2 Last name
%              #3 Title
%              #4 \contactinfoOrLogo command
% Description: Inserts header with name, title and
%              contactinfo or a logo if that is 
%              preferred over contact info.
% Usage      : \header{John}{Doe}{Unknown title}{
%                 \contactinfoOrLogo{. . .}
%              }
% ------------------------------------------------
\newcommand{\header}[4]{
    \begin{minipage}[b][3.9cm][c]{7.5cm}
        {\color{mainTitleColor}
            \section*{{\huge #1\newline #2}}
        }
        {\color{subTitleColor}
            \subsection*{#3}
        }
    \end{minipage}% This comment NEED to be here due to minipage quirks
    \begin{minipage}[b][3.9cm][c]{5cm}   
        #4
    \end{minipage}
}


% ------------------------------------------------
% Command    : \contactinfoOrLogo[4]
% Opt Arg    : #1 filename for logo with or without
%              file extension.
% Argument   : #2 Adress
%              #3 Phone number
%              #4 Email
% Description: Inserts header with name, title and
%              contactinfo or a logo if that is 
%              preferred over contact info.
% Usage      : \contactinfoOrLogo{Adress}
%              {+4670 123 456 78}
%              {john.doe@gmail.com}
%
% Usage      : \contactinfoOrLogo[logo]{Adress}
%              {+4670 123 456 78}
%              {john.doe@gmail.com}
% ------------------------------------------------
\newcommand{\contactinfoOrLogo}[4][]{
    \ifthenelse{\isempty{#1}}
        { 
            \contactinfo{#2}{#3}{#4} 
        }
        { 
            \logo{#1} 
        }
}


% ------------------------------------------------
% Command    : \experience[2]
% Argument   : #1 Text for section
%              #2 A number of \exprow commands
% Description: Inserts a section for experience
% Usage      : \experience{Experience}
%              {\exprow{. . .}}
% ------------------------------------------------
\newcommand{\experience}[2]{
    \section*{#1}
    \vspace{-8pt}
    \hrulefill
    \vspace{10pt}
    #2
    }


% ------------------------------------------------
% Command    : \exprow[6]
% Argument   : #1 Company/school/club name
%              #2 City
%              #3 Date
%              #4 Tools used (skipped if empty)
%              #5 Title
%              #6 Descrition of experience
% Description: Inserts an entry for experience
% Usage      : \exprow{Cool company}
%              {Stockholm, Sweden}
%              {Jun 1920 - Jul 1920}
%              {Erlang, Elixir, Github-actions}
%              {Software Developer}
%              {I did great things}
% ------------------------------------------------
\newcommand{\exprow}[6]{
    \begin{tblr}[expand=\exprow]{
          colspec = {Q[3.2cm, leftsep=0pt]Q[8.87cm]},
          rows    = {halign=l, rowsep=2pt}}
        \textcolor{mainTitleColor}{\footnotesize\uppercase{\textbf{#1}}}
        &
        \textcolor{mainTitleColor}{\footnotesize\uppercase{\textbf{#5}}} \\
        \hline[dashed]
        \textcolor{subTitleColor}{\footnotesize{#2}}
    
        \textcolor{subTitleColor}{\footnotesize{#3}}

        \ifthenelse{\isempty{#4}}{}{ \textcolor{subTitleColor}{\footnotesize{\faWrench\space #4}} }
        &
        \textcolor{subTitleColor}{\footnotesize{#6}} \\[\medskipamount]
    \end{tblr}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages & formats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[export]{adjustbox}
\RequirePackage{fontawesome5}
\RequirePackage{fontspec}
\setmainfont{EB Garamond}

\RequirePackage{graphicx}
\graphicspath{{images/}}

\RequirePackage[colorlinks=true]{hyperref}
\AtBeginDocument{%
    \hypersetup{
        urlcolor=sidebarTextColor,
        urlbordercolor=sidebarTextColor,
        pdfborder={1 1 1},
        pdfborderstyle={/S/U/W 0.1pt}
}}

\RequirePackage[none]{hyphenat}
\RequirePackage{xifthen}
\RequirePackage[margin=0.8cm, a4paper]{geometry}
\RequirePackage{nopageno}
\RequirePackage{paracol}
\RequirePackage{parskip}
\RequirePackage{procv} % This CV style package
\RequirePackage{tabularray}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\titleformat{\section} % <command>
            {\fontsize{10}{1}\fontspec{Fira Sans Medium}\uppercase} % <format>
            {} % <label> to show up for section
            {0em} % <sep> Space between label and title text
            {} % <before-code> Code that shows up before title body
\titlespacing{\section} % <command>
             {0pt} % left spacing
             {10pt} % before spacing
             {5pt} % after spacing
\titleformat{\subsection} % <command>
            {\fontsize{8}{1}\fontspec{Fira Sans Medium}\uppercase} % <format>
            {} % <label> to show up for section
            {0em} % <sep> Space between label and title text
            {} % <before-code> Code that shows up before title body
\titlespacing{\subsection} % command
             {0pt} % left spacing
             {5pt} % before spacing
             {0pt} % after spacing


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands/environments, mainly for internal use
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ------------------------------------------------
% Command    : \link[2]
% Argument   : #1 Icon
%              #2 Url text
% Description: Inserts a url with an icon and text
% Usage      : \link{\faLinkedin}{github.com/xyz}
% Note       : Modified from this code
%              https://github.com/latex-ninja/simple-hipstercv/blob/master/simplehipstercv.sty#L202
% ------------------------------------------------
\newcommand{\link}[2]{
    \begin{tikzpicture}
        \draw[draw=white,fill=white] (0,0) circle (0.2cm);
        \node[] at (0,0) {\footnotesize\color{mainTitleColor} #1};
        \node[right=0.15cm] at (0,0) {\href{http://www.#2}{#2}};
    \end{tikzpicture}
}


% ------------------------------------------------
% Command    : \contactinfo[3]
% Argument   : #1 Adress
%              #2 Phone number
%              #3 Email
% Description: Inserts a contact info section with
%              adress, phone and email.
% Usage      : \contactinfo{Adress}
%              {+4670 123 456 78}
%              {john.doe@gmail.com}
% ------------------------------------------------
% Usage      : \contactinfoOrLogo[logo]{Adress}
%              {+4670 123 456 78}
%              {john.doe@gmail.com}
\newcommand{\contactinfo}[3]{
    \contactinforow{\faMapMarker*{}}{#1}
    \newline
    \contactinforow{\faPhone*{}}{#2}
    \newline
    \contactinforow{\faEnvelope}{#3}
}


% ------------------------------------------------
% Command    : \contactinforow[2]
% Argument   : #1 Icon
%              #2 Text
% Description: Inserts a contact info row with an 
%              icon and text
% Usage      : \contactinforow{\faPhone*{}}
%              {+4670 123 456 78}
% Note       : Modified from this code
%              https://github.com/latex-ninja/simple-hipstercv/blob/master/simplehipstercv.sty#L202
% ------------------------------------------------
\newcommand{\contactinforow}[2]{
    \begin{tikzpicture}
      \draw[draw=mainTitleColor,fill=mainTitleColor] (0,0) circle (0.26cm);
      \node[] at (0,0) {\footnotesize\color{white} #1};
      \node[right=0.25cm] at (0,0) {\footnotesize\color{subTitleColor} #2};
    \end{tikzpicture}
}


% ------------------------------------------------
% Command    : \logo[1]
% Argument   : #1 filename
% Description: Inserts a logo
% Usage      : \logo{logo}
% ------------------------------------------------
\newcommand{\logo}[1]{
    \includegraphics[width=5cm, right]{#1}%
}


% ------------------------------------------------
% Command    : \separatorline
% Description: Inserts horizontal line
% Usage      : \separatorline
% ------------------------------------------------
\newcommand{\separatorline}{
    {\color{separatorLineColor}
        \hrulefill
    }}


% ------------------------------------------------
% Command    : \grade[1]
% Argument   : #1 Skill level for skill, 1-5
% Description: Inserts a skill level row with filled
%              circles 1-5 based on the number given
%              as argument
% Usage      : \grade{3.7}
% Note       : Modified from this code
%              https://tex.stackexchange.com/a/539280
% ------------------------------------------------
\newcommand{\grade}[1]{%
    \pgfmathtruncatemacro\floored{#1}%
    \pgfmathsetmacro\diff{#1-\floored}%
    \newdimen\diffDim%
    \diffDim = \diff pt%
    \newdimen\numPointsDim
    \numPointsDim = #1 pt
    \newdimen\maxPointsDim%
    \maxPointsDim = 5 pt%
    \begin{tikzpicture}
        \foreach \x in {1, ..., 5}{
            \ifnum \x > \floored \relax%
                \def\fillCol{gradeBackColor}%
            \else%
                \def\fillCol{gradeFrontColor}%
            \fi%
            \fill[\fillCol] (15pt*\x, 0) circle (3pt);
        }%
        \ifdim \diffDim > 0 pt \relax%
            \ifdim \numPointsDim > \maxPointsDim \relax%
            \else%
                \pgfmathsetmacro\pos{15pt*(\floored+1)}%
                \begin{scope}[xshift=\pos]
                    \clip (-3pt,-3pt) rectangle ++(3pt*2*\diff,3pt*2);
                    \fill[gradeFrontColor] (0, 0) circle (3pt);
                \end{scope}
            \fi%
        \else%
        \fi%
    \end{tikzpicture}%
}