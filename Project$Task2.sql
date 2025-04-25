use walmart;
select * from walmart_sales;
/*Task 2: Finding the Most Profitable Product Line for Each Branch 
Walmart needs to determine which product line contributes the highest profit to each branch.The profit margin
should be calculated based on the difference between the gross income and cost of goods sold.*/
-- Profit=gross income−cogs

with profit_with_branch as (
select Branch, `Product line`, round(SUM(cogs - `gross income`),2) as Total_profit
from walmart_sales
group by Branch,`Product line`
order by Total_profit desc
)
select Branch , `Product line` , Total_profit, row_number() over(
partition by Branch) as rank_based_on_profit
from profit_with_branch
order by Branch, Total_profit desc;