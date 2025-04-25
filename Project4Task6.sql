use walmart;
/*Task 6: Monthly Sales Distribution by Gender 
Walmart wants to understand the sales distribution between male and female customers on a monthly basis.*/
select * from walmart_sales;
with gender_monthly_sales_distribution as (
select Gender,date_format(str_to_date(Date,'%d-%m-%Y'),'%M') as Month_wise,round(sum(Total),2) as Sales
from walmart_sales
group by Month_wise,Gender
order by Gender
)select * from gender_monthly_sales_distribution;
