use walmart;
/*Task 5: Most Popular Payment Method by City 
Walmart needs to determine the most popular payment method in each city to tailor marketing strategies.*/
select * from walmart_sales;
with city_Ewallet as (
select City, count(Payment) as Payment
from walmart_sales
where Payment = 'Ewallet'
group by City
),
city_Cash as (
select City , count(Payment) as Payment
from walmart_sales
where Payment = 'Cash'
group by City
),
city_Credit_Card as (
select City,count(Payment) as Payment
from walmart_sales 
where Payment = 'Credit card'
group by City
)
select e.City,e.Payment as Ewallet,c.Payment as Cash,cc.Payment as Credit_card
from city_Ewallet e
inner join city_Cash c on e.City = c.City
inner join city_Credit_Card cc on e.City = cc.City
group by e.City;