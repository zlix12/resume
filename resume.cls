\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\newcommand{\addressSep}{$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\newcommand{\@addresstwo}{\relax}
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
    \@ifundefined{@addresstwo}{
        \def \@addresstwo {#1}
    }{
        \@ifundefined{@addressthree}{
            \def \@addressthree {#1}
        }{
            \def \@addressone {#1}
        }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
    \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
    \endgroup
    \par
    \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
    \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
    \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
    \ori@document  % Begin document
    \printname % Print the name specified with \name
    \@ifundefined{@addressone}{}{ % Print the first address if specified
        \printaddress{\@addressone}}
    \@ifundefined{@addresstwo}{}{ % Print the second address if specified
        \printaddress{\@addresstwo}}
    \@ifundefined{@addressthree}{}{ % Print the third address if specified
        \printaddress{\@addressthree}}
}

% Large Resume section
% input 1 - section name
\newenvironment{basicSection}[1]{
    \sectionskip
    \MakeUppercase{\bf #1} % Section title
    \sectionlineskip
    \hrule % Horizontal line
    \begin{list}{}{ % List for each individual item in the section
        \setlength{\leftmargin}{1.5em} % Margin within the section
    }
        \item[]
        }{
    \end{list}
}

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
        {\textbf{#1}} % Bold institution name
    \hfill
    {\em #2}
    \\ {#3}
    \hfill
    }

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
        \newcommand{\namesize}{\huge} % Size of the name at the top of the document
\newcommand{\addressskip}{\smallskip} % The space between the two address (or phone/email) lines
\newcommand{\sectionlineskip}{\medskip} % The space above the horizontal line for each section
\newcommand{\nameskip}{\bigskip} % The space after your name at the top
\newcommand{\sectionskip}{\medskip} % The space after the heading section