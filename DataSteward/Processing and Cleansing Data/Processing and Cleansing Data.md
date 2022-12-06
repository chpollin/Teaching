Folien: https://docs.google.com/presentation/d/1UBn-9Y0bPw0g46Xv42GwiQq0H20IBgXukE3gi-EE9RY/edit?usp=sharing  

# Literatur und Ressourcen

+ van Hooland, S., Verborgh, R., & De Wilde, M. (2013). Cleaning Data with OpenRefine. In A. Crymble, P. Burns, & N. McGregor (Eds.), _The Programming Historian_. https://doi.org/10.46430/phen0023. 
+ Hameed M. and Naumann F. (2020). Data Preparation: A Survey of Commercial Tools. SIGMOD Rec. 49, 3 (September 2020), 18–29. [https://doi.org/10.1145/3444831.3444835](https://doi.org/10.1145/3444831.3444835 "https://doi.org/10.1145/3444831.3444835").
+ Tebeka Miki (2022). Data Cleaning in Python Essential Training. In *LinkedIn Learning*. https://www.linkedin.com/learning/data-cleaning-in-python-essential-training.  
+ Alex The Analyst (2022). Cleaning Data in Excel | Excel Tutorials for Beginners. https://youtu.be/_jmiEGZ6PIY.

## Tags

#datapreperation #datacleansing

# Skript

## "Your data is bad and you should feel bad"

Maybe that's a phrase you'll use one day as a data steward. No, you won't say it out loud, but you'll think it. We all have to deal with bad, dirty and messy data. It is estimated that data scientists, for example, spend about 80% of their time cleaning data. Haven't found any evidence if this is true. But many articles about data cleaning and data preparation starts with that number.

## Types of Error

Data, whether raw, semi-structured or structured, is often messy, bad and invalid.

Let's take a look at some of the most common errors. **Standardization and formatting** of strings, dates and numbers in a data set is a problem. This can include something like spaces, spelling, or dates. We also have to deal with **missing values**. For example, a cell in a table is not filled in. The data may be optional or it may be an error in our data set. Unwanted rows can also be a challenge. Then there are the so-called **bad values**. A data point simply does not match with the record. For example, a year in George Washington's financial papers does not match with the other dates, aperson is 200 years old, or the price of the carrot is 180 € because, for example, a coma has gone lost. **Duplicates** in data are also a problem, of course. Not for every kind of processing, but when we want to count all records, for example, or when we want to enter our data into a database. Furthermore, we also have problems when we have **different encodings and invalid characters**. A letter like "ö" or "ß" is not displayed correctly. And what also often happens is that CSV can be separated with semicolon, comma or tab and how a CSV is encoded can be predefined differently in operating systems. And finally, we can have errors according to a schema. The XML or JSON file is not well-formed, or the XML/TEI file is invalid if it is not a syntactic error but a semantic error.

## Excel/Google Spreadsheet | OpenRefine | Python

We chose these tools because we always want to approach things very pragmatically. I don't like Excel, but every now and then it doesn't help, and then you have to use it. Python, of course, you can only use if you can also program, and then there's a tool in between: OpenRefine. This is a tool that was developed exactly for data preparation and is very powerful, but it is not a programming language. 

## The need of data preperation

Data preparation is defined by Hameed and Neumann as the set of preprocessing operations performed in early stages of a data processing pipeline, i.e., data transformations at the structural and syntactical levels. They distinguish between data preperation and data cleaning. While changing delimiters (like in a CSV file) is an operation that ensures syntactic correctness, handling duplicates is something on the semantic level. In between there are different operations with which we can deal with the different types of errors.

Data preparation is not a single step process. Rather, it usually comprises many individual preparation steps. These data preparation tasks are: 
* Data discovery is the process of analyzing and collecting data from different sources, for instance to match data patterns, find missing data, and locate outliers.
* Data validation comprises rules and constraints to inspect the data, for instance for correctness, completeness, and other data quality constraints.
* Data structuring encompasses tasks for the creation, representation and structuring of information. Examples include updating schema or transform data by example
* Data enrichment adds value or supplementary information to existing data from separate sources. Typically, it involves augmenting existing data with new or derived data values using data soemthign like inserting metadata.
* Data filtering generates a subset of the data under consideration, facilitating manual inspection and removing irregular data rows or values. Examples include extracting text parts, and keeping or deleting filtered rows.
* Data cleaning refers to removal, addition, or replacement of less accurate or inaccurate data values with more suitable, accurate or representative values. Typical examples are deduplication, fill missing values, and removing whitespace.
Despite our definition, which distinguishes data
preparation and cleaning, we include data cleaning
steps here as well, as most data preparation tools
also venture into this area.







### Standardization and Formatting 

#### Dates

### Missing Values

### Bad Values 

### Duplicates 