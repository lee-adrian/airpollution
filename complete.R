complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  y <- vector()
  x <- id
  dat <- data.frame()
  for (i in id) {
    dat <- read.csv(files_list[i])
    y <- rbind(y, sum(complete.cases(dat)==TRUE))
  }
  completedf <- data.frame(x, y)
  colnames(completedf) <- c("id", "nobs")
  return(completedf)
}
