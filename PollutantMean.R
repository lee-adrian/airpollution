pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  if(pollutant == "nitrate") {
    dat$nitrate
  } else if(pollutant == "sulfate") {
    dat$sulfate
  }
  for (i in 1:332) {
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "ID"] %in% id),]
  mean(dat_subset[, pollutant], na.rm=TRUE)
  
} 
