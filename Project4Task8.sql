use walmart;
/*Task 8: Identifying Repeat Customers
Walmart needs to identify customers who made repeat purchases within a specific time frame (e.g., within 30
days).*/
select * from walmart_sales;
-- Let us take the dates and customer id from the walmart_sales table the date is segregatted as the current date and [revious date by using the condition date > date
-- and datediff function is used to find the differencce between the dates to get the number of days
-- and then we are setting a condition of days == 30 to display only the customers with the date range of 30 days.
with Repeat_Customers as (
select cp1.`Customer ID`, cp1.Date as Current_Purchase, cp2.Date as Previous_Purchase,
datediff(str_to_date(cp1.Date, '%d-%m-%Y'), str_to_date(cp2.Date, '%d-%m-%Y')) as Days_Between
from walmart_sales cp1
join walmart_sales cp2 
on cp1.`Customer ID` = cp2.`Customer ID`
and STR_TO_DATE(cp1.Date, '%d-%m-%Y') > STR_TO_DATE(cp2.Date, '%d-%m-%Y')
)select `Customer ID`, Current_Purchase, Previous_Purchase, Days_Between
from Repeat_Customers
where Days_Between = 30
order by `Customer ID`, Current_Purchase;
    
