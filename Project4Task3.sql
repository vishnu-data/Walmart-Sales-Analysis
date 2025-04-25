use  walmart;
/*Task 3: Analyzing Customer Segmentation Based on Spending
Walmart wants to segment customers based on their average spending behavior. Classify customers into three
tiers: High, Medium, and Low spenders based on their total purchase amounts.*/
select * from walmart_sales;
with Average_sales_per_person as (
select `Customer ID`, SUM(Total) as Sales, count(*) as Total_sales, 
SUM(Total) / count(*) as Average_sales_of_person
from walmart_sales
group by `Customer ID`
)
select `Customer ID`,round(Sales,2) as Sales,Total_sales,round(Average_sales_of_person,2) as Avg_sales_of_Person,
case
when Average_sales_of_person < 300 then 'Low'
when Average_sales_of_person between 300 and 350 then 'Medium' 
else 'High'  end as 'Class'
from Average_sales_per_person
order by `Customer ID`,Avg_sales_of_Person;