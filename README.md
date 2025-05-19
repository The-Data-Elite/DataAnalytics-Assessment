MY APPROACH TO QUESTION 1:
At first, I explored the dataset I will be working with for this analysis, which included having a glance at all the tables with thier column names. 
For question 1, I first combined users' first name and last name into a single column 'name'. The query has two joint functions combining rows from users and savings,
also users and plan. Also, the query has subqueries to calculate savings count, investment count, and total deposit.

The issues I encountered at first were a syntax error where I unknowingly omitted the database name from the query; I figured out the error, corrected my syntax, and then 
The code runs without any more problems. 

MY APPROACH TO QUESTION 2:
From the question, it was very clear that I need to calculate the different categories of frequency, and also the number of customers and the average transactions per month
for each frequency category.
The necessary columns were selected and followed by subqueries to make calculations for High, Medium, and Low frequency. The tail end of the query carried the joint clause,
where the necessary tables were joined; left joining the savings_account table to the users table on the right.

MY APPROACH TO QUESTION 3:
Well, this was a big one. Separate subqueries and calculations had to be made for both savings and investment before using UNION ALL as A FULL JOINT to combine both tables.
To be sure that results are not returned for deleted plans, a WHERE clause selecting only active plans(WHERE Is_deleted & Is_archieved = 0)

MY APPROACH TO QUESTION 4:
The first step here is the customer lifetime value, and the column that will be required to run the calculation. This step was followed by selecting the columns, using a subquery to make the calculation, and finally joining the required tables.


Overall, the assessment was challenging and very interesting at the same time. In the process of dealing with this assessment, I have strengthened my knowledge of SQL joins, subqueries, and overall, my problem-solving ability in SQL.

