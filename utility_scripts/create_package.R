devtools::create(  path=file.path(getwd(), "seed"),check=TRUE, description=list(
  "Title"= "Calculator for ADHD Rating Scale IV",
  "Description"="Calculates the subscales of the ADHD Rating Scale IV",
  "Date"="2014-11-27",
  "Author"= "Will Beasley",
  "Maintainer"="'Will Beasley' <wibeasley@hotmail.com>"
))

# devtools::use_testthat()
devtools::use_vignette(name)
devtools::use_travis()
