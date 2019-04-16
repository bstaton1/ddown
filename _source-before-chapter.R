
# this script gets sourced prior to knitting each chapter

# load packages: these are all for the knitr::kable(...) %>% kableExtra::...() table workflow
library(dplyr)
library(knitr)
library(kableExtra)

# clear the workspace: start each chapter fresh
rm(list = ls(all = T))

# set global RMarkdown chunk options: never print code, output, or warnings/messages
knitr::opts_chunk$set(
  echo = F,              # never print code
  message = F,           # never print messages
  warning = F,           # never print warnings
  fig.align = "center"  # center figures
)

# function to help split cells in tables
add_break = function(x) {
  x = stringr::str_split(x, "\\(") %>% unlist
  x = matrix(x, length(x)/2, 2, byrow = T)
  x[,2] = paste("(", x[,2], sep = "")
  x = apply(x, 1, function(z) paste(z, collapse = "\n"))
  kableExtra::linebreak(x, align = "c")
}

# function to insert commas in large numbers
prettify = function (x) {
  prettyNum(x, big.mark = ",", scientific = F)
}