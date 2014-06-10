\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{katz_resume}[2014-06-09 Katz Resume Style v1]

\LoadClass{article}

\RequirePackage{titlesec}
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{paralist}
\RequirePackage{tabto}
\RequirePackage{microtype}
\RequirePackage{url}

\newcommand{\@authorname}{}
\newcommand{\@email}{}
\newcommand{\@streetaddress}{}
\newcommand{\@citystatezip}{}
\newcommand{\@phone}{}
\newcommand{\@webpage}{}

\renewcommand{\author}[1]{\renewcommand{\@authorname}{#1}}
\newcommand{\email}[1]{\urldef{\@email}{\url}{#1}}
\newcommand{\streetaddress}[1]{\renewcommand{\@streetaddress}{#1}}
\newcommand{\citystatezip}[1]{\renewcommand{\@citystatezip}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\webpage}[1]{\urldef{\@webpage}{\url}{#1}}

\newcommand{\mydot}{\hspace{1ex}\textbullet\hspace{1ex}}

\renewcommand{\maketitle}{
    \centerline{{\Huge \textsc \@authorname}}
    \smallskip
    \centerline{{\@streetaddress}\mydot
                {\@citystatezip}\mydot
                {\@phone}}
    \centerline{{\@email}\mydot
                {\@webpage}}
    \smallskip
    \centerline{\small \textsc (Reccomendations Available Upon Request)}
}

\titleformat{\section}
  {\large\scshape}
  {}{0em}
  {}
  [\titlerule]

\titleformat{\subsection}
  {\large\scshape}
  {}{0em}
  {}


\newcommand{\job}[5]{
    \item[]{\textbf{#1}\ \textit{at #2} \hfill #3 \-- #4}\\#5
}

\newcommand{\school}[6]{
    \item[]{\textbf{#1}\ (GPA\ #2) \hfill #3 \-- #4}\\#5 \hfill #6
}

\newcommand{\experience}[2]{
    \item[]{\textbf{#1}\\#2}
}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}

\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}

\newenvironment{jobs}{\begin{itemize}}{\end{itemize}}

\newenvironment{schools}{\begin{itemize}}{\end{itemize}}

\newenvironment{projects}{\begin{itemize}}{\end{itemize}}

\newenvironment{awards}{\begin{itemize}}{\end{itemize}}

\newenvironment{skills}[1]
 {\noindent\NumTabs{#1}\inparaenum\let\latexitem\item
  \def\item{\def\item{\tab\latexitem}\latexitem}}
 {\endinparaenum}
