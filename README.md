# Getting and Cleaning Data Project

## Project Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Getting and Cleaning Data Process
For a detailed process of getting the project data, and cleaning the raw data to create a tidy dataset, see [CookBook.md](www.github.com/anneg1000/mygettingandcleaningdata/blob/master/CodeBook.md)

## How to create the tidy dataset
1. clone this repo: git clone git@github.com:anneg1000/mygettingandcleaningdata.git
2. from the RStudio: set the working directory to the local repo's directory using setwd()
3. from the R Console: source("run_analysis.R")

    The script will download the dataset zip file, unzip the content, clean up the data accordingly, and write the following two files to the working directory: 
    - tidydata.txt - the tidy data with related columns
    - tidydata_with_average.txt - tidy data set with the average of each variable for each activity and each subject
