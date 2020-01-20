corr <- function(directory, threshold = 0){ 
  completedcases <- complete(directory, 1:332)
  overthreshold <- subset(completedcases, nobs > threshold)
  dat <- data.frame()
  fullid <- data.frame()
  files_list <- list.files(directory, full.names=TRUE)
  laststep <- vector()
  

    fullnobs <- subset(overthreshold, select = c("nobs"))
    fullid <- subset(overthreshold, select = c("id"))
  
      for (i in overthreshold$id) {
        dat <- read.csv(files_list[i])
        dat_subsetomit <- na.omit(dat)
      ifelse (fullnobs > threshold,  laststep <- c(laststep, cor(dat_subsetomit$nitrate, dat_subsetomit$sulfate)), 0)
      }
    return(laststep)
  }