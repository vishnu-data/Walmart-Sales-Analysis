use walmart;
/*Task 10: Analyzing Sales Trends by Day of the Week 
Walmart wants to analyze the sales patterns to determine which day of the week
brings the highest sales.*/
select * from walmart_sales;
select date_format(str_to_date(Date,'%d-%m-%Y'),'%W') as Day_of_the_week,
round(sum(Total),2) as Total_sales
from walmart_sales
group by Day_of_the_week;
-- we have got the total sales now if we plot a line chart or an area chart we would be getting the total sales distribution.