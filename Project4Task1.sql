create database walmart;
use walmart;
select * from walmart_sales;
/*Task 1: Identifying the Top Branch by Sales Growth Rate
Walmart wants to identify which branch has exhibited the highest sales growth over time. Analyze the total sales
for each branch and compare the growth rate across months to find the top performer.*/

-- --------------------------------------------------------------------------------------------------------------------------------
select  Branch,sum(Total) as "Sales", DATE_FORMAT(STR_TO_DATE(Time, '%H:%i'), '%H:%i')
 as Time_of_Order
from walmart_sales
group by Branch,Time_of_Order
order by Time_of_Order;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Walmart wants to know:
Which branch is growing the fastest in terms of sales over time?
"Sales growth over time" means comparing the total sales across different months for each branch and 
measuring the percentage increase or decrease from month to month.
The branch with the highest growth rate overall will be the top performer.*/
-- creating a CTE that contains Branch,Month_year and Total_Sales
with monthly_sales as (
select Branch,date_format(str_to_date(Date,'%d-%m-%Y'), '%Y-%m') as month_year,
SUM(Total) as monthly_sales
from walmart_sales
group by Branch,month_year
),
sales_with_growth as(
    select Branch,month_year,monthly_sales,lag(monthly_sales)
    over(partition by Branch order by month_year) as previous_month_sales,
    ((monthly_sales - lag(monthly_sales)
    over(partition by Branch order by month_year))/lag(monthly_sales)
    over(partition by Branch order by month_year)) * 100 as growth_rate
    from monthly_sales
)
select Branch,round(avg(growth_rate),2) as avg_growth_rate
from sales_with_growth group by Branch
order by avg_growth_rate DESC
limit 1;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
