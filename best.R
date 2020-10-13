#Author: sha-naya
#Date: 02/06/2020
#Description: This .R file contains the function best()
#It outputs the best hospital in a given state and type of health condition.
#Ex. best("NC", "heart failure")
#The example above would output the best hospital in NC for heart failure.

best <- function(state, outcome) {
  
  if(state %in% nonrep.names == FALSE) {stop("invalid state")}
  
  if(outcome == "heart attack") {
    
    state.subset <- subset(outcome.data, State == state , select = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name))
    best.rate <- min(state.subset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm = TRUE)
    df.final <- subset(state.subset, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == best.rate)
    df.final[order(df.final$Hospital.Name),]###
    return(df.final$Hospital.Name)
    
  }
  if(outcome == "heart failure") {
    
    state.subset <- subset(outcome.data, State == state, select = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name))
    best.rate <- min(state.subset$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, na.rm = TRUE)
    df.final <- subset(state.subset, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == best.rate)
    df.final[order(df.final$Hospital.Name),]###
    return(df.final$Hospital.Name)
    
  }
  if(outcome == "pneumonia") {
    
    state.subset <- subset(outcome.data, State == state, select = c(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name))
    best.rate <- min(state.subset$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, na.rm = TRUE)
    df.final <- subset(state.subset, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == best.rate)
    df.final[order(df.final$Hospital.Name),]###
    return(df.final$Hospital.Name)
      
  }
  
  else(stop("invalid outcome")) 
  
}