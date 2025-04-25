use walmart;
/*Task 9: Finding Top 5 Customers by Sales Volume 
Walmart wants to reward its top 5 customers who have generated the most sales Revenue.*/
select * from walmart_sales;
select `Customer ID`,round(sum(Total),2) as Total_Sales from
walmart_sales
group by `Customer ID`
order by Total_Sales DESC
limit 5;