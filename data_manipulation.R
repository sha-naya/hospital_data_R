outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
#include full path if you download the data for your own use!!!

outcome.data[,11] <- as.numeric(outcome.data[,11])
outcome.data[,17] <- as.numeric(outcome.data[,17])
outcome.data[,23] <- as.numeric(outcome.data[,23])

all.state.names <- outcome.data$State
nonrep.names <- all.state.names[!duplicated(all.state.names)]

#final.df <- data.frame() *for rankall() function