---
title: "CodeBook"
author: "nihalhabeeb"
date: "9/15/2020"
output: pdf_document
---

# Codebook

## Data

### Human Activity Recognition Using Smartphones Dataset Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables

* **feature:** name of all variables
* **trainX:** training data set
* **trainActiviy:** activity labels for training data
* **trainSubject:**  subjects who performed the activiy
* **trainData:** combined training data
* **testX:** test data set
* **testActivity:** activity labels for test data
* **testSubject:** subjects who performed the activiy
* **testData:** combined test data
* **dataMerged:** both training and test data combined
* **mean.std:** mean and standard deviation for each measurement extracted from features
* **dataMS:** merged data set with mean and standard deviation extracted
* **activityLabels:** activity names
* **varNames:** descriptive variable names
* **tidyData:** final cleaned data set

## Transformations

1. Training and test data is merged.
2. Mean and Standard deviation for each measurements were isolated.
3. Activities were labelled with descriptive activity names
4. Variable names were changed from short ones to descriptive labels.
5. Variable names were cleaned i.e "[]" and "()" were removed.