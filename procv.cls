\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{procv}[2025/08/13 A professional CV template class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

% ------------------------------------------------
% Commands/environments, to be used from .tex file
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

\newcommand{\profilepic}[1]{
    \begin{center}
        \begin{tikzpicture}
            \clip (0,0) circle [radius=1.7cm] node {\includegraphics[width=3.4cm]{#1}};
        \end{tikzpicture}
    \end{center}
    }


\newcommand{\aboutme}[1]{
    {\color{sidebarTextColor}
        \section*{ABOUT ME}
        #1 
    }
    \newline
    \separatorline
}

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

\newcommand{\skill}[2]{
    {\color{sidebarTextColor} #1 } & \grade{#2} \\
}    

\newcommand{\links}[1]
    {
        {\color{sidebarTextColor}
            \section*{Links}
        }
        #1
        \newline
        \separatorline
    }

\newcommand{\link}[2]{
    \begin{tikzpicture}
        \draw[draw=white,fill=white] (0,0) circle (0.2cm);
        \node[] at (0,0) {\footnotesize\color{mainTitleColor} #1};
        \node[right=0.15cm] at (0,0) {\href{http://www.#2}{#2}};
    \end{tikzpicture}
}

\newenvironment{personal}
    {
        {\color{sidebarTextColor}
            \section*{Personal details}
        }
        \begin{tabular}{@{}ll}
    }
    {
        \end{tabular}
        \vspace{6pt}
        \newline
        \separatorline
    }

\newcommand{\detail}[2]{
    {\color{sidebarTextColor} #1 } & {\color{sidebarTextColor} #2 } \\
}

\newcommand{\hobbies}[1]{
    {\color{sidebarTextColor}
        \section*{Hobbies}
        #1
    }
    \newline
    \separatorline

}

\newcommand{\references}[1]{
    {\color{sidebarTextColor}
        \section*{References}
        #1    
    }
    \newline
    \separatorline
}

\newcommand{\header}[4]{
    \begin{minipage}[b][3.9cm][c]{7.5cm}
        {\color{mainTitleColor}
            \section*{{\huge \uppercase{#1}\newline \uppercase{#2}}}
        }
        {\color{subTitleColor}
            \subsection*{\uppercase{#3}}
        }
    \end{minipage}% This comment NEED to be here due to minipage quirks
    \begin{minipage}[b][3.9cm][c]{5cm}
        #4
    \end{minipage}
}



\newcommand{\contactinfo}[2]{
    \begin{tikzpicture}
      \draw[draw=mainTitleColor,fill=mainTitleColor] (0,0) circle (0.26cm);
      \node[] at (0,0) {\footnotesize\color{white} #1};
      \node[right=0.25cm] at (0,0) {\footnotesize\color{subTitleColor} #2};
    \end{tikzpicture}
}

\newcommand{\logo}[1]{
    \includegraphics[width=5cm, right]{#1}
}

\newenvironment{experience}[1]
    {
        \section*{#1}
        \vspace{-8pt}
        \hrulefill
        \vspace{10pt}
        \begin{tblr}[expand=\exprow]{
          colspec = {Q[3.2cm, leftsep=0pt]Q[8.9cm]},
          rows    = {halign=l, rowsep=2pt}
          }
    }
    {
        \end{tblr}
    }

\newcommand{\exprow}[6]{
    \textcolor{mainTitleColor}{\footnotesize\uppercase{\textbf{#1}}}
    &
    \textcolor{mainTitleColor}{\footnotesize\uppercase{\textbf{#5}}} \\
    \hline[dashed]
    \textcolor{subTitleColor}{\footnotesize{#2}}
    
    \textcolor{subTitleColor}{\footnotesize{#3}}

    \ifthenelse{\isempty{#4}}{}{ \textcolor{subTitleColor}{\footnotesize{\faWrench\space #4}} }
    &
    \textcolor{subTitleColor}{\footnotesize{#6}} \vspace{1pt}\\[\medskipamount]
}


% ------------------------------------------------
% Packages
% ------------------------------------------------
%\RequirePackage{float}
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
\RequirePackage{tabularray}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\titleformat{\section} % <command>
            {\fontsize{11}{1}\fontspec{Fira Sans Medium}} % <format>
            {} % <label> to show up for section
            {0em} % <sep> Space between label and title text
            {} % <before-code> Code that shows up before title body
\titlespacing{\section} % <command>
             {0pt} % left spacing
             {10pt} % before spacing
             {5pt} % after spacing
\titleformat{\subsection} % <command>
            {\fontsize{8}{1}\fontspec{Fira Sans Medium}} % <format>
            {} % <label> to show up for section
            {0em} % <sep> Space between label and title text
            {} % <before-code> Code that shows up before title body
\titlespacing{\subsection} % command
             {0pt} % left spacing
             {5pt} % before spacing
             {0pt} % after spacing



% ------------------------------------------------
% Commands, for intrnal use in this class file
% ------------------------------------------------
\newcommand{\separatorline}{
    {\color{separatorLineColor}
        \hrulefill
    }}


\newcommand{\gradelong}[6]{%
    \pgfmathtruncatemacro\floored{#1}%
    \pgfmathsetmacro\diff{#1-\floored}%
    \newdimen\diffDim%
    \diffDim = \diff pt%
    \newdimen\numPointsDim
    \numPointsDim = #1 pt
    \newdimen\maxPointsDim%
    \maxPointsDim = #2 pt%
    \begin{tikzpicture}
        \foreach \x in {1, ..., #2}{
            \ifnum \x > \floored \relax%
                \def\fillCol{#6}%
            \else%
                \def\fillCol{#5}%
            \fi%
            \fill[\fillCol] (#3*\x, 0) circle (#4);
        }%
        \ifdim \diffDim > 0 pt \relax%
            \ifdim \numPointsDim > \maxPointsDim \relax%
            \else%
                \pgfmathsetmacro\pos{#3*(\floored+1)}%
                \begin{scope}[xshift=\pos]
                    \clip (-#4,-#4) rectangle ++(#4*2*\diff,#4*2);
                    \fill[#5] (0, 0) circle (#4);
                \end{scope}
            \fi%
        \else%
        \fi%
    \end{tikzpicture}%
}

\newcommand{\grade}[1]{
    \gradelong
    {#1}        % grade as floating point value
    {5}         % max number of points
    {15pt}      % spacing between points
    {3pt}       % radius of point
    {gradeFrontColor}% foreground color
    {gradeBackColor} % background color
}