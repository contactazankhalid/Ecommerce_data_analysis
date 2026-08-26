                    --- solve bussiness question 
select * from sales
--1 category_wise revenue 
select
product_category,
round(sum(revenue)::numeric,2) as total_revenue
from sales 
group by product_category 
order by sum(revenue) desc

--2 Most_common payment method
select 
payment_method,
count(order_id) as total_orders
from sales 
group by 1 
order by 2 desc 

--3 region_wisw revenue 
select 
region,
round(sum(revenue)::numeric,2) as total_revenue
from sales
group by 1 
order by 2 desc;

--4 count of customers who rated the products equal to and less than 3.5 
select 
count(customer_id) as customer_id, 
customer_rating 
from sales 
where customer_rating =<3.5
group by 2

--5 count of customers who rated the products greater than 3.5 
select 
count(customer_id) as customer_id, 
customer_rating 
from sales 
where customer_rating >3.5
group by 2

-- 6category_wise orders 
select
product_category,
count(order_id) as total_orders 
from sales 
group by product_category
order by 2 desc 

--7 category_wise quantity 
select
product_category,
sum(quantity) as total_quantity 
from sales 
group by product_category
order by 2 desc

--8fast_delvery and late delvery
select
max(delivery_days) as late_delivery,
min(delivery_days) as fast_delivery
from sales

--9 region_wise customer count
select
region,
count(customer_id) as total_customer 
from sales
group by 1 
order by 2 desc;

--10Top 5 customer with most orders
select
distinct(customer_id),
count(order_id) 
from sales 
group by 1 
order by 2 desc
limit 5
select * from sales
--11 month_wise revenue 
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(revenue)::numeric, 2) AS total_sale
FROM sales
GROUP BY 1, 2
ORDER BY 1 ASC, 2 ASC;
select * from sales
--12Discount Impact:
SELECT 
    product_category,
    ROUND(AVG(discount)::numeric * 100, 2) AS avg_discount_percentage,
    ROUND(SUM(quantity * unit_price * discount)::numeric, 2) AS total_discount_given,
    ROUND(SUM(quantity * unit_price)::numeric, 2) AS gross_revenue,           -- Bina discount ke total
    ROUND(SUM(quantity * unit_price * (1 - discount))::numeric, 2) AS net_revenue -- Discount ke baad actual revenue
FROM sales
GROUP BY product_category
ORDER BY net_revenue DESC;

--13 avg_rating
SELECT 
    product_category,
    ROUND(AVG(customer_rating)::numeric, 2) AS avg_rating,
    COUNT(order_id) AS total_reviews
FROM sales
GROUP BY product_category
ORDER BY avg_rating DESC;






                  

		