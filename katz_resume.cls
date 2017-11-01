\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{katz_resume}[2014-09-02 Katz Resume Style]

\LoadClass{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{titlesec}
\RequirePackage[left=0.4in,right=0.4in,top=0.25in,bottom=0.25in]{geometry}
\RequirePackage{paralist}
\RequirePackage{tabto}
\RequirePackage{microtype}
\RequirePackage{url}
\RequirePackage{ifthen}
\RequirePackage{tikz}
\RequirePackage{anyfontsize}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage{lmodern}

\newcommand{\@authorname}{}
\newcommand{\@email}{}
\newcommand{\@streetaddress}{}
\newcommand{\@citystatezip}{}
\newcommand{\@phone}{}
\newcommand{\@webpage}{}
\newcommand{\@objective}{}

\renewcommand{\author}[1]{\renewcommand{\@authorname}{#1}}
\newcommand{\email}[1]{\urldef{\@email}{\url}{#1}}
\newcommand{\streetaddress}[1]{\renewcommand{\@streetaddress}{#1}}
\newcommand{\citystatezip}[1]{\renewcommand{\@citystatezip}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\webpage}[1]{\urldef{\@webpage}{\url}{#1}}
\newcommand{\objective}[1]{\renewcommand{\@objective}{#1}}

\newcommand{\mydot}{\hspace{1ex}\textbullet\hspace{1ex}}

\renewcommand{\maketitle}{
\begin{minipage}{0.62\textwidth}
{\fontsize{36}{45} \textsc \@authorname}

\medskip
\footnotesize{\@objective}
\end{minipage}
%\hfill\vline\hfill
\begin{minipage}{0.32\textwidth}

\hfill\@webpage

\hfill\@email

\hfill\@phone

\hfill\@streetaddress

\hfill\@citystatezip

\end{minipage}
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
    \item[]{{\large \textbf{#1}}\textit{ #2, #3} \hfill #4 \-- #5}
}

\newcommand{\school}[6]{
    \item[]{\textbf{#1}\ (GPA\ #2) \hfill #3 \-- #4}\\#5 \hfill #6
}

\newcommand{\project}[1]{
    \item{\small #1}
}

\newcommand{\award}[3]{
    \item{\textbf{#1}\ \ifthenelse{\equal{#2}{}}{ }{(#2)} \hfill \textit{#3}}
}

\newenvironment{jobs}{\begin{itemize}}{\end{itemize}}

\newenvironment{projects}{\begin{itemize}[leftmargin=*,label=\tabitem]}{\end{itemize}}

\newenvironment{schools}{\begin{itemize}}{\end{itemize}}

\newenvironment{awards}{\begin{itemize}}{\end{itemize}}

\newcommand\rating[2]{%
    \ifnum#1>#2
        $#1 > #2$
        \else
        \ifnum#1<0
        $#1 < 0$
        \else
        \ifnum#2<0
        $#2 < 0$
        \else
        \tikz{%
            \ifx#20
                \else
                \foreach \i in {1,...,#2} {
                    \filldraw[black!20] (\i ex,0) circle (0.4ex);
                };
            \fi
                \ifx#10
                \else
                \foreach \i in {1,...,#1} {
                    \filldraw[black] (\i ex,0) circle (0.4ex);
                };
            \fi
        }
        \fi
    \fi
\fi
}

\newcommand{\tabitem}{~~\llap{\textbullet}~~}

\newcommand\skill[3]{{\normalsize #3} & \rating{#1}{#2}\\}

\font\semiboldfont=ec-lmr8 at 10pt
\newcommand\semibold[1]{{\semiboldfont #1}}
