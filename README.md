# caseyishere.github.io
![My Photo](images/Profile pic.png)
# Customer analysis SQL project
This project uses SQL to analyze customer behavior using a sample Cyclist data. It includes queries for
- Counts, Averages, Percent differences
- Comparative values shown side by side

There was also data cleaning done in Google Spreadsheets. Filtered and cleaned blanks, duplicates, nulls and time values.
Used formulas to sum averages up. 

## Files
- cyclist#2dataMay.xlsx - Cyclist data for May
- Cyclistdata.xlsx - Cyclist data for April
- MayandAprildata.sql - SQL code
- Mayandapril_data_sql.csv - Sql csv
- Cyclist presentation.pdf - Presentation
- https://public.tableau.com/app/profile/casey.lemos/viz/CyclistData_17477707417620/Dashboard1 - Visual Dashboard

## Tools used
- BigQuery for SQL execution
- Excel 
- Tableau
- Google Slides

## Author
[Casey Lemos](https://github.com/caseyishere)

### The Company
Cyclistic is a fictional bike-share company based in Chicago, US. They have classic bikes and electric bikes. They sell 3 bike-share tiers:
1. Single-Ride Passes (“casual rider”)
2. All-Day Passes (“casual rider”)
3. Annual Membership

### Background
I am a Data Analyst working at Cyclistic. The Director of Marketing believes the company’s future success depends on maximising the number of annual memberships. Therefore, the Director of Marketing wants to understand how casual riders and annual membership riders use Cyclistic bikes differently. 

### Questions to Answer
1. How do annual members and casual riders use bikes differently?
2. What are the differences between the months of May and April?

### Objective
Identify if there are differences in the days that cyclist use bikes that contribute in the amount of time the cyclist use them. 

### Google Spreadsheet Analysis

Pivot Table for April
<img width="602" alt="Pivot Table" src="https://github.com/user-attachments/assets/3cea17f5-1665-4488-b532-e956ad45fc2f" />


Pivot Table for May
<img width="624" alt="Pivot table May" src="https://github.com/user-attachments/assets/1edd8295-bfb7-46f5-ba4f-20af4aa643a7" />

### BigQuery SQL
<img width="965" alt="BigQuery SQL Cyclist" src="https://github.com/user-attachments/assets/7a090a6e-e7be-4ce0-a86e-43fd49911e25" />
<img width="941" alt="Cyclist SQL 24-40" src="https://github.com/user-attachments/assets/42d90b15-9b7e-4f81-90b0-0ad8ceb87ab4" />
<img width="609" alt="Cyclist SQL 47-69" src="https://github.com/user-attachments/assets/184ace55-f996-4584-9a50-74cfec611c39" />
<img width="898" alt="Cyclist SQL 70-92" src="https://github.com/user-attachments/assets/bfe0bd2c-180d-45dd-8e43-669618a7a167" />
<img width="227" alt="Cyclist SQL 93-103" src="https://github.com/user-attachments/assets/179c2e25-340e-492f-aae9-07e6a8806616" />

### BigQuery SQL Results
<img width="1264" alt="Query Results" src="https://github.com/user-attachments/assets/e0e9a9a2-774e-492f-bfed-a2bd1ab416e7" />

### BigQuery SQl Total Average
Average for Casual and Member riders
<img width="967" alt="Total average for april and may minutes" src="https://github.com/user-attachments/assets/0bc96ec1-3170-46a1-ade7-c129fd73f971" />
<img width="718" alt="Total Average 22-30" src="https://github.com/user-attachments/assets/fda1fea7-5119-4ae4-9005-bc666c011013" />

Query Results 

<img width="676" alt="Query Results Average" src="https://github.com/user-attachments/assets/1c76493a-27a0-472f-b811-83ffae4e4587" />


### Tableau Data

<img width="1440" alt="Tableau Cyclist Data" src="https://github.com/user-attachments/assets/0045ad1a-9217-4d45-8363-ff445331f8d7" />

In the month of April, average minutes, ride count and percent difference vary by day of the week for casual and annual members.
There is little correlation between day of week and ride count. 
Saturday and Sunday are strong indicators of how cyclist use bikes differently. 

In the month of May, the bar chart shows that there are more casual riders biking on Saturday than any given day. 
 Annual members use the bikes for less minutes than casual members on any given day.
 Average minutes in April for annual members is 18 minutes and May is 19.25 minutes.
Average minutes in April for casual members is 39.29 and May is 44.31. 

### Conclusion
1. 	Casual members on average
 use bikes longer than 
annual members.

2. There are more casual members
 riding bikes on Saturday and 
Sunday than any given day.

3. There are more cyclist using 
bikes depending on the
 month. 





In this project of how Cyclist annual members and casual members use bikes differently, I demonstrate my thought process of analyzing data. I make sure the data is clean and rid of any blanks, duplicates and other errors in excel. I than create a pivot table to further analyze the data. Once I have a clear understanding of the data, I transfer the data to big query. I than create tables and write a query that joins the two data sets I imported. I than transfer the created query to tableau and create a visual. 
