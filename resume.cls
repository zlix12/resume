\ProvidesClass{resume}[2022/12/17 v1.0 Resume class]

\LoadClass[11pt,letterpaper]{article}

\RequirePackage[parfill]{parskip}
\RequirePackage{array}
\RequirePackage{ifthen}

\pagestyle{empty}

% Setters
\newcommand{\name}[1]{ \newcommand\@name{#1} }
\newcommand{\address}[1]{ \newcommand\@address{#1} }
\newcommand{\contact}[1]{ \newcommand\@contact{#1} }
\newcommand{\social}[1]{ \newcommand\@social{#1} }

% Private Methods
\newcommand{\@printheaderitem}[1]{
    \begingroup
        \centerline{#1}
    \endgroup
    \addressskip
}

\newcommand{\@printname}{
    \begingroup
        \hfil{\MakeUppercase{\namesize\textbf \@name}}\hfil
        \nameskip\break
    \endgroup
}

% Redefs
\let\ori@document=\document
\renewcommand{\document}{
    \ori@document
    \@printname
    \@printheaderitem{\@address}
    \@printheaderitem{\@contact}
    \@printheaderitem{\@social}
}

% Large Resume section
% input 1 - section name
\newenvironment{basicSection}[1]{
    \sectionskip
    \MakeUppercase{\bf #1}
    \sectionlineskip
    \hrule
    \begin{list}
        {}
        { \setlength{\leftmargin}{1.5em} }
        \item[]
    }
{\end{list}}

% Work experience section
% input 1 - company name
% input 2 - employed range
% input 3 - job title
% input 4 - location
\newenvironment{workExperienceSection}[4]{
        {\bf #1} \hfill {#2} % Bold company name and date on the right
    {\em #3} \hfill {\em #4} % Italic job title and location
}

% Work experience sub section
% input 1 - section name
\newenvironment{workExperienceSectionSubSection}[1]{
    \vspace{0.5em} % Some space after the list of bullet points

        {\bf\em #1} \hfill
    \smallskip
    \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
        \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
        }{
    \end{list}
    \vspace{0.5em} % Some space after the list of bullet points
}

% Eductation Formatting
% input 1: institution name
% input 2: date range
% input 3: degree
\newenvironment{educationSection}[3]{
        {\bf{#1}} % Bold institution name
    \hfill
    {\em #2}
    \\ {#3}
    \hfill
    }

% Size
\newcommand{\namesize}{\large}

% Whitespace
\newcommand{\nameskip}{\bigskip}
\newcommand{\addressskip}{\smallskip}
\newcommand{\sectionlineskip}{\medskip}
\newcommand{\sectionskip}{\medskip}