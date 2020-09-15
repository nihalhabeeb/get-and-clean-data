---
title: "README"
author: "nihalhabeeb"
date: "9/15/2020"
output: pdf_document
---

# READ ME

This repository includes the following files:
* **Codebook.md** describes the data, variables and transformations
* **run_alaysis.R** R script that download and process the data to produce a tidy data

## Working of run_analysis.R

This R script:

* downloads *Human Activity Recognition Using Smartphones Dataset* from UCI website
* Extract the file
* Combine all the training and test data to one dataset
* Extract mean and standard deviation of each measurements and isolate them in respect to the combined single data set
* Label the activities and variable names descriptively
* Produce a new tidy dataset by aggregating the existing dataset in terms of activity and subject.
* Write the tidy data into a new text file

