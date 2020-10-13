# Useful Functions for Working with *Hospital Data
Assignment for R Programming course (Coursera; Johns Hopkins University)

This repo contains the programming assignment for the R Programming course.
Given data of US hospitals in the form of a .csv file, I was tasked with creating
several useful functions for performing quick searches. 

The function best() outputs the best hospital in a given state and health condition.
For example, best("NC", "heart failure") would output the best hospital in North Carolina
for heart failure.

The function rankall() outputs the best, worst, or custom chosen hospitals based on the
provided health condition. So, rankall("pneumonia", "worst") would output the worst
hospitals for pneumonia. Note: this function has issues in its current state; will be
updated in the near future.

The function rankhospital() outputs the hospital for the given ranking, state, and health
condition. For example, rankhospital("NC", "pneumonia", 5) would output the top 5 hospitals
in North Carolina for pneumonia. 

Please keep in mind that first(1), the dataset that was provided to me and thus, will be
included here does not belong to me and is courtesy of Johns Hopkins University, and second(2),
the included code is from very early on in my programming studies so it is not representative
of my current ability and skill.
