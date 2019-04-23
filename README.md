## ddown

This repository stores the source code used to generate Ben Staton's doctoral dissertation: **Development and Evaluation of Assessment Tools and Management Strategies for Salmon Fisheries in Western Alaska**. 

> The exact copy hosted by the Auburn University in their [electronic thesis and dissertation database](<http://hdl.handle.net/10415/6645>) was generated using this code.

The dissertation was written in plain text files (primarily `.Rmd`) using Markdown and LaTeX syntax and rendered into a PDF book format using the R package `{bookdown}` ([here](https://github.com/rstudio/bookdown)). LaTeX files for formatting were [provided](http://graduate.auburn.edu/current-students/etd-samples/) by Auburn University, though slight edits were necessary to make them compatible with the `{bookdown}` framework (the edited files are found in this repository). 

Although other authors have found success using the [thesisdown](https://github.com/ismayc/thesisdown) approach to custom-create their theses for their own institution, I had trouble getting this to render with the style files I had access too. Thus, I started from scratch with the standard `{bookdown}` template and made the required alterations to get it to work. I plan to produce a template of this framework for other Auburn graduate students to use, perhaps students at other universities will find it useful as well.

## Organization of Files

### Output

The rendered output as well as the `.tex` file used to compile it are located in the `docs` directory.

### Main Content

All `.Rmd` files that contain code for chapters, appendices, and figures/tables are located in the main directory and start with a number. For example, the file `02-rt-fcst.Rmd` contains all code needed to render Chapter 2. These are the files where writing occurred. 

`06-appendix-head.Rmd` is necessary to ensure all chapters after it are rendered as appendices.

### Analytical Output

All outputs from analyses to be printed as figures or tables are located in the `img` (figures) or `tab` (tables) directories, which are further subdivided by chapter. Tables are manipulated using R code and rendered nicely using `knitr::kable(..., format = "latex", booktabs = T) %>% kableExtra::funcs()`. The analyses were conducted in other directories and their raw outputs were placed in these directories. This approach was taken rather than performing the analyses in the Rmarkdown framework primarily for computational reasons -- many analyses took days or weeks to complete.

I plan to eventually push all code and data for all analyses to GitHub.

### "LaTeX" Files

Files required for the appropriate formatting using LaTeX include:

*  `aums.sty` and `auphd.sty`: style files provided by Auburn University
*  `preamble.tex`: loads LaTeX packages and sets up some additional formatting. Anything before `\begin{document}` goes here.
*  `before_body.tex`: contains additional formatting as well as the text for the dissertation abstract and acknowledgements.
*  `myapalike.bst`: the bibliography style file. I made some slight changes to the base apalike style, including making "et al." italic.
*  `cites-with-doi.bib`: all citation metadata for those that could be easily downloaded from the internet because they had a DOI.
*  `cites-without-doi.bib`: all citation meta data for those that could not be downloaded, _i_._e_., I had to enter them in by hand. These include reports, books, book chapters, instruction manuals, _etc_.

### `{bookdown}` Files

Files necessary for using the `{bookdown}` framework include:

*  `index.Rmd`: contains the overall YAML header for the book
*  `_bookdown.yml`: contains more YAML information including the name of the output file and where it should be stored
*  `_output.yml`: contains more YAML information including how the book should be `knitr`-ed
*  `_source-before-chapter.R`: contains R code that is to be executed before each chapter is rendered. It loads packages, clears the workspace, and defines some functions used in creating tables.
*  `ddown.Rproj`: the RStudio project file. To render the book, you will need to have this package active (as well as a LaTeX distribution - look into the `{tinytex}` package, though I used the full MikTex distribution).

## Acknowledgements

In addition to the long list of people and organizations recognized in the dissertation text, I would like to extend a special thanks to the developers at RStudio for creating the tools of `{rmarkdown}` and `{bookdown}`. Using this framework made the process much more enjoyable than had I used the standard word processor workflow, and I am very grateful!

I spent a good amount of time teaching myself the necessary understanding of LaTeX to get up and running. I'm also grateful to the countless brave souls who posted their seemingly elementary questions in online forums and for the dedicated and knowledgeable folks who answered them - without these exchanges I would have been completely lost at times! 
