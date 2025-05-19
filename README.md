MY APPROACH TO QUESTION 1:
At first I explored the dataset I will be working with for this analysis, which included having a glance at all the tables with thier column names. 
For question 1, I first combined users first name and last name into a single column 'name'. The query has two joint functions combining rows from users and savings,
also users and plan. Also the query has subqueries to calculate savings count, investment count and total deposit.

The issues I encountered at first was a syntax error where I unknowingly omitted the database name from the query; I figured out the error corrected my syntax and then 
the code run without any more problem. 

MY APPROACH TO QUESTION 2:
From the question it was very clear that I need to calculate for the different categories of frequency, and also the the number of customers and the average transactions per month
for each frequency category.
The neccesary colomns where selected and followed by subqueries to make calculations for High, Medium, and Low frequency. The tail end of the query carried the joint clause,
where the neccesry tables where joint; left joining savings_account table to the users table on the right.

MY APPROACH TO QUESTION 3:
Well, this was a big one seperate subqueries and calculations had to be made for both savings and investment before using UNION ALL as A FULL JOINT to combine both tables.
To be sure that results are not returned for deleted plans, a WHERE clause selecting only active plans(WHERE Is_deleted & Is_archieved = 0)

MY APPROACH TO QUESTION 4:

