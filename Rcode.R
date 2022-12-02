library(dplyr)
library(tidyverse)
library(mice)

#Input Data
ess <- readRDS("Ess round 9.RDS")

head(ess)

head(ess$name)
table(ess$cntry)

data <- filter(ess, cntry == "NL")

table(ess$cntry)

#Find the column full of NAs
findNACol <- function(data){
  ind_vec <- c()
  j <- 1
  for (i in 1 : length(data[1, ])) {
    if(sum(is.na(data[, i])) == length(data[, i])){
      ind_vec[j] <- i
      j <- j + 1
    }
  }
  return(ind_vec)
}

ind_NL <- findNACol(ess_NL)

ess_NL2 <- ess_NL[, -ind_NL]
colSums(ess_NL2)