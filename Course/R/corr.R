corr <- function(directory, threshold = 0) {
        filelist <- list.files(directory, full.names = TRUE)
        x <- length(filelist)
        vec <- vector("numeric", length = 0)
        for(i in 1:x){  
                dat_temp <- read.csv(filelist[i])               
                nobs <- sum(complete.cases(dat_temp))
                if(nobs>threshold){
                        ndata <- dat_temp[complete.cases(dat_temp),][,"nitrate"]
                        sdata <- dat_temp[complete.cases(dat_temp),][,"sulfate"]
                        vec <- rbind(vec,cor(sdata,ndata))
                }             
        }
        vec
}