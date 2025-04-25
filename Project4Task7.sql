use walmart;
/*Task 7: Best Product Line by Customer Type 
Walmart wants to know which product lines are preferred by different customer types(Member vs. Normal).*/
select * from walmart_sales;
with Product_lines_based_on_types_of_customers as (
select `Customer type`,`Product line`,round(avg(rating),2) as Rating
from walmart_sales
group by `Customer type`,`Product line`
order by `Customer type`,Rating DESC
)select * from Product_lines_based_on_types_of_customers;

-- For displaying only the Top Product lines from both of the customer types.
with Members as (
select `Customer type`,`Product line`,round(avg(rating),2) as Rating
from walmart_sales
group by `Customer type`,`Product line`
having `Customer type` = 'Member'
order by `Customer type`,Rating DESC
limit 1
), Normal as (
select `Customer type`,`Product line`,round(avg(rating),2) as Rating
from walmart_sales
group by `Customer type`,`Product line`
having `Customer type` = 'Normal'
order by `Customer type`,Rating DESC
limit 1
)
select * from Members
union all
select * from Normal;
