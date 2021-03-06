pollutantmean <- function(directory, pollutant, id = 1:332) {
        fileslist <- list.files(directory, full.names=TRUE)
        dat <- data.frame()
        for (i in 1:332){
                dat <- rbind(dat, read.csv(fileslist[i]))
        }
        dat_subset <- dat[which(dat[,"ID"]%in%id),]
        mean(dat_subset[,pollutant],na.rm = TRUE)
}
