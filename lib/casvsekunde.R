cas.v.sekunde <- function(x) {
  parts <- as.numeric(unlist(strsplit(gsub("x", "0", as.character(x)), "[:.]")))
  secs <- c(3600, 60, 1, 0.1)
  return(sum(parts * secs[1:length(parts)]))
}