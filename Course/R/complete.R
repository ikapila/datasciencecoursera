complete <- function(directory, id = 1:332) {
        filelist <- list.files(directory, full.names = TRUE)
        x <- nrow(filelist)
        dat <- data.frame(id=numeric(0),nobs=numeric(0))
        for(i in id){
                dat_temp <- read.csv(filelist[i])
                id2 = dat_temp[1,"ID"]
                nobs <- sum(complete.cases(dat_temp))
                dat[nrow(dat)+1,] <- c(id2,nobs)
        }
        dat[which(dat[,"id"]%in%id),]
}