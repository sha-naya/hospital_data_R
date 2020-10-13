#Author: sha-naya
#Date: 02/06/2020
#Description: This .R file contains the function rankhospital() 
#The output of this function is a hospital based on 3 parameters,
#*state, *outcome, and *num.
#Ex. rankhospital("NC", "pneumonia", 7)
#So, the example above would result in the top 7 best hospitals in NC for pneumonia.

rankhospital <- function(state, outcome, num = "best") {
  
  if(num == "best") {num <- 1}
  
  if(state %in% nonrep.names == FALSE) {stop("invalid state")}
  
  if(outcome == "heart attack") {
    
    state.subset.2 <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    state.subset.2 <- na.omit(state.subset.2)
    state.subset.2 <- state.subset.2[order(state.subset.2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, state.subset.2$Hospital.Name),]
    num.hospitals <- length(state.subset.2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    
    if(num == "worst") {num <- num.hospitals}
    if(num > num.hospitals) {return(NA)}
    
    state.subset.2$Rank <- 1:num.hospitals
    
    df.final.2 <- subset(state.subset.2, Rank == num, c(Hospital.Name))
    return(df.final.2$Hospital.Name)
    
  }
  
  if(outcome == "heart failure") {
    
    state.subset.2 <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    state.subset.2 <- na.omit(state.subset.2)
    state.subset.2 <- state.subset.2[order(state.subset.2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, state.subset.2$Hospital.Name),]
    num.hospitals <- length(state.subset.2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    
    if(num == "worst") {num <- num.hospitals}
    if(num > num.hospitals) {return(NA)}
    
    state.subset.2$Rank <- 1:num.hospitals
    
    df.final.2 <- subset(state.subset.2, Rank == num, c(Hospital.Name))
    return(df.final.2$Hospital.Name)
    
  }
  
  if(outcome == "pneumonia") {
    
    state.subset.2 <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    state.subset.2 <- na.omit(state.subset.2)
    state.subset.2 <- state.subset.2[order(state.subset.2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, state.subset.2$Hospital.Name),]
    num.hospitals <- length(state.subset.2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
    if(num == "worst") {num <- num.hospitals}
    if(num > num.hospitals) {return(NA)}
    
    state.subset.2$Rank <- 1:num.hospitals
    
    df.final.2 <- subset(state.subset.2, Rank == num, c(Hospital.Name))
    return(df.final.2$Hospital.Name)
    
  }
  
  else(stop("invalid outcome"))
  
}
#Notes: This code is rather stupid, so to say. A more refined version can achieve the same goal.