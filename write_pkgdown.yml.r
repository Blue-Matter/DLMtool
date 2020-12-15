
# backup yml
file <- "_pkgdown.yml"
file.copy(file, to="../_pkgdown.yml_backup")

# delete _pkgdown.yml
file.remove(file)

# write new _pkgdown.yml
file.create(file)
cat("title: DLMtool Functions", append=TRUE, file=file)
cat("\nicon: logo.png", append=TRUE, file=file)
cat("\ntemplates: \n   params: \n    bootswatch: yeti", append=TRUE, file=file)
cat("\nnavbar: \n   title: DLMtool Documentation", append=TRUE, file=file)
cat("\n   type: inverse", append=TRUE, file=file)
cat("\n   left: ", append=TRUE, file=file)
# cat("\n   - text: User Guide", append=TRUE, file=file)
# cat("\n     href: userguide/introduction.html", append=TRUE, file=file)
cat("\n   - text: Management Procedures", append=TRUE, file=file)
cat("\n     href: reference/index.html", append=TRUE, file=file)
cat("\nreference:", append=TRUE, file=file)

MPtype <- c("Output Controls", "Input Controls", "Mixed Controls")
Desc <- c("Management Procedures that return a total allowable catch (TAC)",
          "Management Procedures that return a total allowable effort (TAE), spatial closure, or size regulation",
          "Management Procedures that return a combination of Output and Input controls",
          "Management Procedures used as Performance References")
for (n in seq_along(MPtype)) {
  cat("\n- title: ", MPtype[n], append=TRUE, file=file)
  cat("\n  desc: ", Desc[n], append=TRUE, file=file)
  cat("\n  contents: ", append=TRUE, file=file)
  type <- unlist(strsplit(MPtype[n], " "))[1]
  mps <- avail(type, package='DLMtool')
  for (mp in mps) {
    cat("\n  - '`", mp, "`'", append=TRUE, file=file, sep="")
  }
}
cat("\n", append=TRUE, file=file)

## @knitr pkgdown_docs
pkgdown::build_site()
