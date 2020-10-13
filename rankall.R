#Author: sha_naya
#Date: 02/06/2020
#Description: This .R file contains the function rankall() 
#The purpose of this function is to output hospitals based on
#a health condition and a number representing the desired quantity.
#Ex. head(rankall("pneumonia", 5), 15)

rankall <- function(outcome, num = "best") {
  
  if(num == "best") {num <- 1}
  
  if(outcome == "heart attack") {
    
    for(state in nonrep.names) {
      
      state.subset <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, State))
      state.subset.1 <- na.omit(state.subset)
      state.subset.2 <- state.subset.1[order(state.subset.1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, state.subset.1$Hospital.Name),]
      
      rank.id <- nrow(state.subset.1)
      
      state.subset.2$Rank <- 1:rank.id
      
      if(num == "worst") {### this *worst scenario does not work properly... this will be fixed at some later date
        state.subset.w <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, State))
        state.subset.w <- na.omit(state.subset.w)
        length.w <- length(state.subset.w$State)
        num <- length.w
      }
      
      if(num > rank.id) {
        df.na <- data.frame(Hospital.Name = c("<NA>"), State = state, stringsAsFactors = FALSE)
        final.df <- rbind(final.df, df.na)
        next()
      }
      
      state.subset.3 <- subset(state.subset.2, Rank == num, c(Hospital.Name, State))
      
      final.df <- rbind(final.df, state.subset.3)
      
    }
    
  }
  
  if(outcome == "heart failure") {
    
    for(state in nonrep.names) {
      
      state.subset <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, State))
      state.subset.1 <- na.omit(state.subset)
      state.subset.2 <- state.subset.1[order(state.subset.1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, state.subset.1$Hospital.Name),]
      
      rank.id <- nrow(state.subset.1)
      
      state.subset.2$Rank <- 1:rank.id
      
      if(num == "worst") {### this *worst scenario does not work properly...
        state.subset.w <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, State))
        state.subset.w <- na.omit(state.subset.w)
        length.w <- length(state.subset.w$State)
        num <- length.w
      }
      
      if(num > rank.id) {
        df.na <- data.frame(Hospital.Name = c("<NA>"), State = state, stringsAsFactors = FALSE)
        final.df <- rbind(final.df, df.na)
        next()
      }
      
      state.subset.3 <- subset(state.subset.2, Rank == num, c(Hospital.Name, State))
      
      final.df <- rbind(final.df, state.subset.3)
      
    }
    
  }
  
  if(outcome == "pneumonia") {
    
    for(state in nonrep.names) {
      
      state.subset <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, State))
      state.subset.1 <- na.omit(state.subset)
      state.subset.2 <- state.subset.1[order(state.subset.1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, state.subset.1$Hospital.Name),]
      
      rank.id <- nrow(state.subset.1)
      
      state.subset.2$Rank <- 1:rank.id
      
      if(num == "worst") {### this *worst scenario does not work properly...
        state.subset.w <- subset(outcome.data, State == state , select = c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, State))
        state.subset.w <- na.omit(state.subset.w)
        length.w <- length(state.subset.w$State)
        num <- length.w
      }
      
      if(num > rank.id) {
        df.na <- data.frame(Hospital.Name = c("<NA>"), State = state, stringsAsFactors = FALSE)
        final.df <- rbind(final.df, df.na)
        next()
      }
      
      state.subset.3 <- subset(state.subset.2, Rank == num, c(Hospital.Name, State))
      
      final.df <- rbind(final.df, state.subset.3)
      
    }
    
  }
  
  final.df <- final.df[order(final.df$State),]
  return(final.df)
  
}
#Notes: This functions is quite stupid, so to say. Without a doubt, the same output can be accomplished
#with simpler code. 