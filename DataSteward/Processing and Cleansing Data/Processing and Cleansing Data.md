#teaching #datapreperation #datacleansing

Folien: https://docs.google.com/presentation/d/1UBn-9Y0bPw0g46Xv42GwiQq0H20IBgXukE3gi-EE9RY/edit?usp=sharing  

# Literatur und Ressourcen

+ van Hooland, S., Verborgh, R., & De Wilde, M. (2013). Cleaning Data with OpenRefine. In A. Crymble, P. Burns, & N. McGregor (Eds.), _The Programming Historian_. https://doi.org/10.46430/phen0023. 
+ Hameed M. and Naumann F. (2020). Data Preparation: A Survey of Commercial Tools. SIGMOD Rec. 49, 3 (September 2020), 18–29. [https://doi.org/10.1145/3444831.3444835](https://doi.org/10.1145/3444831.3444835 "https://doi.org/10.1145/3444831.3444835").
+ Tebeka Miki (2022). Data Cleaning in Python Essential Training. In *LinkedIn Learning*. https://www.linkedin.com/learning/data-cleaning-in-python-essential-training.  
+ Alex The Analyst (2022). Cleaning Data in Excel | Excel Tutorials for Beginners. https://youtu.be/_jmiEGZ6PIY.
+ Delpeuch, A. (2020). Running a Reconciliation Service for Wikidata. [https://ceur-ws.org/Vol-2773/paper-17.pdf](https://ceur-ws.org/Vol-2773/paper-17.pdf)

# Skript

## Introduction

Hello and welcome to the "Processing and Cleansing Data" lecture as part of the Data Steward certificate course.

I hope everyone's comfortable and can hear and see me clearly. 

My name is Christopher Pollin and my colleague Christian Steiner and I would like to invite you to what we hope will be an interesting and straightforward course on data cleaning, data preparation, bad data and the tools we can use to get better data. This is the first time that we give a talk in this kind of setting. So if you have any feedback for us, we would love to hear it.

We'll avoid the "everyone introduce themselves" introductions, as I'm sure you've done enough of that already, and we'll just introduce ourselves.

And I know a bit of the background because I've already looked at the Moodle course.

--> Christian

### Agenda

Let's take a look at our agenda. It is divided into two blocks. The first part is held by me and is the more theoretical aspect of the class. We will discuss terms like data preparation and look at different examples. Then, after a short break, Christian will show you how to get started with openRefine.

If you have any questions, please interrupt us, give us feedback if something is not clear, or write a message in the chat. 

### Learning Outcomes

The intended learner outcomes are: 
* Describe basic approaches and methods for cleaning, normalising, enriching and preparing datasets for further processing. 
* Describe the principles of Linked Open Data using Wikidata as an example. 
* Understand how to use the OpenRefine software for cleaning, normalisation and semantic enrichment of datasets via Wikidata (matching).

The assessment includes participation and a small task using the OpenRefine tool. 

## Introduction to data preparation, data cleaning, data enrichment and some examples

OK! Then let's get started. This slide gives you an overview of some relevant resources, including articles and papers as well as youtube videos and tutorials. They cover more or less the same content. 

### "Your data is bad and you should feel bad"

Maybe one day, as a data steward, you'll use this phrase. No, you won't say it out loud, but it will cross your mind at some point. You can't imagine all the things that can be entered incorrectly. We all deal with bad, dirty and messy data. Let me start with two numbers: It is estimated that data scientists spend about 80% of their time cleaning data, and the estimated cost of poor data quality to the US economy is up to $3.1 trillion. I have found no evidence that this is true. But many articles or introductory tutorials try to use one of these figures to argue why data cleansing is important.

## Types of Error

Data, whether raw, semi-structured or structured, is often messy, bad or invalid. As a result, it does not help you to solve a particular problem. You need to get rid of the mess.

Let's take a look at some of the most common errors:

+ The **standardisation and formatting** of strings, dates and numbers in a data set can be a problem. This can include spaces, spelling or dates.. 
+ We also have to deal with **missing values**. For example, a cell in a table is not filled in. The data may be optional, or it may be an error in our dataset. We don't know. Unnecessary rows can also be a challenge. 
+ Then there are the **bad values**. This is when a data point does not match the record. For example, a year in a dataset does not match at all with the other dates, a person is 200 years old, or the price of a carrot is €180 because a coma is missing. 
+ Of course, **duplicates** in data are also a problem. Not for every type of processing, but if we want to count all the records, for example, or if we want to enter our data into a database, we have to handle them.
+ We also have problems with **different encodings and invalid characters**. A letter like "ö" or the German "ß" will not be displayed correctly. Another common problem is that CSVs can be separated by semicolons, commas or tabs, and the way CSVs are encoded can be different on different operating systems. Like the US always has different metric systems and stuff.
+ Finally, there may be schema-related errors. The XML or JSON file is not well-formed - we have some syntactical errors in our data, or the data is invalid according to the schema of our metadata standard, leading to semantic errors.

## Excel/Google Spreadsheet | OpenRefine | Python

Christian and I always like to approach things in a very pragmatic way. In this talk we will look at some tools that can help us in our daily work. These tools are Google Spreadsheet or Excel, the programming language Python and the software OpenRefine. And hopefully it will be a learning outcome: I'm using OpenRefine now. that's pretty cool.

Personally, I have a certain aversion to Excel. But at some point you have to work with it, and it's helpful to know how to use it to prepare your data. The advantage of Google Spreadsheet is that anyone can use it and it's really easy to set up falt workflows for data acquistion. Python is obviously a programming language and requires programming skills. But there is something in between: OpenRefine. It is a tool designed specifically for data preparation and it is very powerful and not that difficult to use and Christian will show you how to get started.

## The need of data preperation

But let's stay with the definition for a moment.

Data preparation is defined by Hameed and Neumann as the set of preprocessing operations performed in the early stages of a data processing pipeline, such as data transformations at the structural and syntactic levels. They distinguish between data preparation and data cleaning. While changing delimiters (as in a CSV file) is an operation that ensures syntactic correctness, handling duplicates is something at the semantic level. In between, there are different operations to deal with different types of errors, such as normalising date formats. by the way: normalizing dates can be very anyoing if you have historical data and are using Excel.

## Data Preparation Tasks

Data preparation is not a one-step process. Rather, it usually consists of many individual preparation steps. Hameed and Neumann identify the following data preparation tasks:
* **Data discovery** is the process of analyzing and collecting data from different sources, for example to match data patterns, find missing data and locate outliers.
* **Data validation** includes rules and constraints to check data for correctness, completeness and other data quality constraints.
* **Data Structuring** includes tasks for creating, representing and structuring information. Examples include updating a schema.
* **Data enrichment** adds value or additional information to existing data from different sources. It typically involves enhancing existing data with new or derived data using techniques such as the insertion of metadata. Reconcilation, for example, allows you to enrich your data with existing Linked Open Data resources.
* **Data filtering** creates a subset of the data under consideration to facilitate manual inspection and removal of irregular data rows or values. Examples include extracting text parts and retaining or deleting filtered rows.
* **Data cleansing** refers to the removal or replacement of less accurate or inaccurate data values with more appropriate, accurate or representative values. Typical examples include deduplication, filling in missing values, and removing blank characters. So all the things we have already heard about the types of errors.

Are there any questions or comments? If not, we will close the definitions section and spend the rest of the first block on examples of dirty data.

### Standardization and Formatting 

Here we see tabular data about the presidents of the USA. We have a column for the name, the position before the presidency, the party affiliation and the vice presidents.

What kind of errors do you see in terms of standardisation and formatting?

* Uppercase vs. lowercase: “john adams”, “JAMES MONROE”, “Thomas Jefferson”
* Additional spaces : “  Aaron Burr”, “John C. Calhoun”
* Non-consistent text fields: “Whig   April 4, 1841  â€“  September 13, 1841”, “Whig”
* Encoding: “â€“

Let's take a look at some straightforward solutions for cleaning up such things.

#### Standardization and Formatting - Filtering

I prepared a Google spreadsheet. So we will not have hands-on because time is limited and doing this online is always a bit tricky. So the idea is more to follow the presentation and try out the same tasks on your own. If you do so: please make a copy of this google spreadsheet.

{making a copy}

#### Standardization and Formatting - Filtering in US_Presidents

Data visualisation is an example of something you might want to do with clean data. The "part"y column in the "US_Presidents" tab is categorical data. And any typos like "Republican" or "Republicans" will result in a separate category and a new bar in a bar chart, for example. 

In the Google spreadsheet, you can easily create a filter and see all the different values. That way you can check if there are any errors at all. And then you can just fix them manually. Data filtering is one of the data preparation tasks we discussed earlier. Thats also how we can identify and remove "Whig April 4, 1841 â€“ September 13, 1841". 

Manual changes can be handy, but the important thing is to keep a copy of the original. The advantage of Google Spreadsheet is that it has a complete version history. And you have to think, can't I do this automatically?

#### Standardization and Formatting - Whitespace in US_Presidents

In the next step, we want to remove the spaces we find in the data fields "Aaron Burr" and "John C Calhoun". 

Every programming language and most tools have a way of normalising strings.

Lets go to the "Vice" column in the US_Presidents tab, create a new column and normalise the string using the TRIM() or GLETTEN() function.

It is a trivial example, I know, but it shows exactly what data cleansing is all about.

#### Standardization and Formatting - Whitespace in US_Presidents

proper(), president

#### Missing Values in cart_missing_values

Here we have another small dataset. It is about products in a shopping basket in a database. We have a date, a name, the quantity of a product and a price. Very basic example. And now we have to deal with missing values. Another type of error I mentioned earlier.

With this formula you can identify missing cells in a row. "If" and then follows the condition that evaluates to true or false if something in a row is empty, then do something: write "empty cell exists". This can be useful if you have 60 columns and 10,000 rows and you are completely lost with only one screen to look at your data. This helps to identify which rows might need further preparation. If you are using libraries like Panda for Python, they have built-in functions that can help you with this too.

#### Missing Values - Python

I won't go into too much detail here. Linked is a github repository of the Data Cleaning with Python course if you want to dig deeper into the topic.

#### Bad Values 

Carrots seem to be very expensive these days. 3 carrots for the price of $217. Bad values are not so easy to clean automatically, because you need domain knowledge. Of course, this domain knowledge could be represented in a knowledge base, but this becomes too complex if you only work with everyday data. Ways to deal with this are to filter the data, as we saw earlier, calculate statistics, or create visualisations to identify outliers and other bad values. 

Raw Graphs

#### Duplicates 

Duplicates are the last type of error we will look at. Instead of one Trump, two Barack Obamas would be really cool. But there is only one Obama out there, so we have to reduce these duplicates.

#### Duplicates - Smart Clean Up

We have been doing trivial things. So maybe Google is smart enough to do this for us. And yes, Google is smart enough. There is a section called "Smart Clean-up" in Google Spreadsheets.

Daten/Datenbereinigung/Vorschläge zur Datenbereinigung.

It identifies duplicates, whitespaces. it does not identifie the bad values or the typos

### Schema

### Semantic Enrichment 

Wikidata is the largest public knowledge graph (KG), containing nearly 1.5 billion statements about 90 million entities. 

Data enrichment adds value to existing data from disparate sources. And semantic enrichment emphasises the semantic level of this approach. 