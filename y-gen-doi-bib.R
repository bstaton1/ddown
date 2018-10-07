# this function takes a bibtex record and gives it a reference name
sub_ref = function(bib, ref) {
  # extract the first line of bibtex entry
  bib_split = strsplit(bib, ",")
  info = bib_split[[1]][1]
  
  type = stringr::str_extract(info, 
                              pattern = c("book", "article",
                                          "manual", "report"))
  type = type[!is.na(type)]
  new_info = paste("@", type, "{", ref, sep = "")
  bib_split[[1]][1] = new_info
  paste(unlist(bib_split), collapse = ",")
}

# enter the reference names and doi's for anything that has a doi
dois = c(
  "adkison-cunningham-2015" = "10.1139/cjfas-2015-0174",
  "anderson-beer-2009" = "10.1890/08-0477.1",
  "clark-etal-2015" = "10.1080/00028487.2015.1031281",
  "cooke-etal-2008" = "10.1577/1548-8446-33.7.321",
  "burger-etal-1985" = "10.1139/f85-089",
  "catalano-jones-2014" = "10.1080/02755947.2014.951801",
  "cooperman-etal-2010" = "10.1086/650473",
  "hasler-scholz-1983" = "10.1007/978-3-642-82070-0",
  "hinch-etal-2012" = "10.1111/j.1095-8649.2012.03360.x",
  "hodgson-etal-2006" = "10.1111/j.1365-2419.2005.00354.x",
  "keefer-etal-2008" = "10.1577/T07-008.1",
  "mundy-evenson-2011" = "10.1093/icesjms/fsr080",
  "omalley-etal-2010" = "10.1098/rspb.2010.0762",
  "quinn-etal-2000" = "10.1111/j.0014-3820.2000.tb00569.x",
  "walters-holling-1990" = "10.2307/1938620",
  # "mantua-etal-1997" = "10.1175/1520-0477(1997)078"
  "reynolds-etal-2007" = "10.1175/2007JCLI1824.1",
  "vandepol-etal-2016" = "10.1111/2041-210X.12590",
  "arlot-celisse-2010" = "10.1214/09-SS054",
  "bailey-vandepol-2016" = "10.1371/journal.pone.0167980",
  "burnham-anderson-2002" = "10.1007/b97636"
  )

# obtain the items
bibs = rcrossref::cr_cn(dois = dois, .progress = "text",
                        format = "bibtex")

# rename the references
bibs = sapply(1:length(bibs), function(r) {
  sub_ref(bibs[[r]], ref = names(bibs)[r])
})

# dump the output into a .bib file
cat(paste(bibs, collapse = "\n\n"), file = "cites-with-doi.bib")
  
