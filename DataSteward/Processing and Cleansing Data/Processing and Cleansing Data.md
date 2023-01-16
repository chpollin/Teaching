#teaching #datapreperation #datacleansing

Folien: https://docs.google.com/presentation/d/1UBn-9Y0bPw0g46Xv42GwiQq0H20IBgXukE3gi-EE9RY/edit?usp=sharing  

# Literatur und Ressourcen

+ van Hooland, S., Verborgh, R., & De Wilde, M. (2013). Cleaning Data with OpenRefine. In A. Crymble, P. Burns, & N. McGregor (Eds.), _The Programming Historian_. https://doi.org/10.46430/phen0023. 
+ Hameed M. and Naumann F. (2020). Data Preparation: A Survey of Commercial Tools. SIGMOD Rec. 49, 3 (September 2020), 18–29. [https://doi.org/10.1145/3444831.3444835](https://doi.org/10.1145/3444831.3444835 "https://doi.org/10.1145/3444831.3444835").
+ Tebeka Miki (2022). Data Cleaning in Python Essential Training. In *LinkedIn Learning*. https://www.linkedin.com/learning/data-cleaning-in-python-essential-training.  
+ Alex The Analyst (2022). Cleaning Data in Excel | Excel Tutorials for Beginners. https://youtu.be/_jmiEGZ6PIY.
+ Delpeuch, A. (2020). Running a Reconciliation Service for Wikidata. [https://ceur-ws.org/Vol-2773/paper-17.pdf](https://ceur-ws.org/Vol-2773/paper-17.pdf)

# Skript

## "Your data is bad and you should feel bad"

Maybe that's a phrase you'll use one day as a data manager. No, you won't say it out loud, but it will certainly cross your mind at some point. We all deal with bad, dirty, and messy data. I would like to start with two numbers: It is estimated that data scientists spend about 80% of their work time on cleaning data, and the estimated cost of poor data quality for the economy og the US is as high as $3.1 trillion. I have found no evidence that this is true. But many articles or introductory tutorials try to use one of these two numbers to argue why data cleansing matters.

## Types of Error

Data, whether raw, semi-structured or structured, is often messy, bad and invalid. And therefore they do not support you in solving a particular problem.

Let's take a look at some of the most common errors:

+ **Standardization and formatting** of strings, dates and numbers in a data set is a problem. This can include something like spaces, spelling, or dates. 
+ We also have to deal with **missing values**. For example, a cell in a table is not filled in. The data may be optional or it may be an error in our data set. Unwanted rows can also be a challenge. 
+ Then there are the so-called **bad values**. A data point simply does not match with the record. For example, a year in George Washington's financial papers does not match with the other dates, aperson is 200 years old, or the price of the carrot is 180 € because, for example, a coma has gone lost. 
+ **Duplicates** in data are also a problem, of course. Not for every kind of processing, but when we want to count all records, for example, or when we want to enter our data into a database. 
+ Furthermore, we also have problems when we have **different encodings and invalid characters**. A letter like "ö" or "ß" is not displayed correctly. And what also often happens is that CSV can be separated with semicolon, comma or tab and how a CSV is encoded can be predefined differently in operating systems. 
+ Finally, there may be errors related to a schema. The XML or JSON file is not well-formed - we have some syntactic errors in our data, or the data is invalid according to the schema of our metadata standard, which leads to semantic errors.

## Excel/Google Spreadsheet | OpenRefine | Python

Christian and I always want to deal with things in a very pragmatic way. In this talk we will look at some tools that can help us in our daily work. These tools are Google Spreadsheet or Excel, the programming language Python and the software OpenRefine.

Personally, I have a certain aversion to Excel. But at some point you have to work with it, and it's helpful to know how to use it to prepare your data. The advantage of Google Spreadsheet is that anyone can use it and it's really easy to set up workflows for data collection. Python, of course, is a programming language and you need to know how to program. But there is something in between: OpenRefine. This is a tool exactly developed for data preparation and is very powerful and not that hard to use.

## The need of data preperation

But let's stay with the definition of terms for a moment.

Data preparation is defined by Hameed and Neumann as the set of preprocessing operations performed in early stages of a data processing pipeline, like. data transformations at the structural and syntactical levels. They distinguish between data preperation and data cleaning. While changing delimiters (like in a CSV file) is an operation that ensures syntactic correctness, handling duplicates is something on the semantic level. In between there are different operations with which we can deal with different types of errors.

## Data Preparation Tasks

Data preparation is not a single step process. Rather, it usually comprises many individual preparation steps. These data preparation tasks are: 
* **Data discovery** is the process of analyzing and collecting data from different sources, for instance to match data patterns, find missing data, and locate outliers.
* **Data validation** comprises rules and constraints to inspect the data, for instance for correctness, completeness, and other data quality constraints.
* **Data structuring** encompasses tasks for the creation, representation and structuring of information. Examples include updating schema or transform data by example
* **Data enrichment** adds value or supplementary information to existing data from separate sources. Typically, it involves augmenting existing data with new or derived data values using data soemthign like inserting metadata.
* **Data filtering** generates a subset of the data under consideration, facilitating manual inspection and removing irregular data rows or values. Examples include extracting text parts, and keeping or deleting filtered rows.
* **Data cleaning** refers to removal, addition, or replacement of less accurate or inaccurate data values with more suitable, accurate or representative values. Typical examples are deduplication, fill missing values, and removing whitespace.

### Standardization and Formatting 

Here we see tabular data about presidents of the USA. We have a column for names, the position before the presidency, party affiliation and vice presidents.

What kind of errors can you identify in ter ms of standardization and formatting?

* Uppercase vs. lowercase: “john adams”, “JAMES MONROE”, “Thomas Jefferson”
* Additional spaces : “  Aaron Burr”, “John C. Calhoun”
* Non-consistent text fields: “Whig   April 4, 1841  â€“  September 13, 1841”, “Whig”
* Encoding: “â€“

Let's take a look at a few solutions to clean up such things.

#### Standardization and Formatting - Filtering

The category data is important for visualization, for example, and must be the same string. Each blank character creates a new category, so to speak.

Manual changes can be handy, but the most important thing is that you don't do them for nothing and keep a copy of the initial situation. The advantage of Googel Spradsheet is that it has a complete version history. And you have to think, "can't I do this automated as well."

#### Standardization and Formatting - Whitespace

#### Standardization and Formatting - Uppercase vs. lowercase 

### Missing Values

### Bad Values 

### Duplicates 