use walmart;
/*Task 4: Detecting Anomalies in Sales Transactions Walmart suspects that some transactions have unusually high or low sales compared to the average for the
product line. Identify these anomalies.*/
select * from walmart_sales;
with Product_line_with_z_score as (
select `Product line`,round(avg(Total),2) as Average_sales, round(stddev(Total),2) as Standard_deviation
from walmart_sales
group by `Product line`
),
sales_with_zscore as (
select ws.`Product line`,ws.Total,((ws.Total - ps.Average_sales)/ps.Standard_deviation) as Z_score
from walmart_sales as ws
inner join  Product_line_with_z_score ps on ws.`Product line` = ps.`Product line` 
)
select `Product line`,Total,Z_score ,
case
when Z_score > 3 or Z_score < -3 then 'Anamoly'
else 'Normal' end as Anomaly_status
from sales_with_zscore
order by Anomaly_status ,`Product line`, Total;
-- The reason we use 3 in the Z-score is based on the Empirical Rule (68-95-99.7 Rule) in statistics. 
/*
According to the Empirical Rule:
About 68% of data points lie within 1 standard deviation from the mean.
About 95% of data points lie within 2 standard deviations from the mean.
About 99.7% of data points lie within 3 standard deviations from the mean.
*/