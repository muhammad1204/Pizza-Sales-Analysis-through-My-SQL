SELECT * from pizza_sales;

-- Q1. Calculate the Total Revenue
SELECT sum(total_price) as Total_Revenue from pizza_sales;

-- Q2. Calculate AVERAGE value per Order 
 SELECT  SUM(total_price) / COUNT(DISTINCT order_id) as Average_Order_Value FROM pizza_sales;

-- Q3. Calculate the Total number of Pizzas Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- Q4. Calculate the Total number of  Order Placed
SELECT COUNT(DISTINCT order_id) AS Total_Order_Placed FROM pizza_sales;

-- Q5. Calculate Average Pizza quantity  Per Order placed
select round( sum(quantity) / count(distinct order_id) ,2) as Average_Pizza_Per_Order from pizza_sales;

-- Q6.	Calculate Daily Trend for Total Orders
select dayname(order_date) as Order_day , count(distinct order_id) as Total_Orders from pizza_sales
group by dayname(order_date) order by total_orders desc;

-- Q7.	Calculate Monthly Trend for Orders
select monthname(order_date) as Month_Name , count(distinct order_id) as Total_Orders from pizza_sales
group by monthname(order_date);

-- Q8.	Calculate % of Pizza Sales by Category 
select pizza_category , round(sum(total_price),2) as Revenue , round(sum(total_price) *100 / (select sum(total_price) from pizza_sales),2) as pct from pizza_sales group by pizza_category;

-- Q9	Find % of Sales by Pizza Size
select pizza_size , round(sum(total_price),2) as Revenue , round(sum(total_price) *100 / (select sum(total_price) from pizza_sales),2) as pct from pizza_sales group by pizza_size order by pizza_size;

-- Q10.	Findl Total number of  Pizzas sold by category.
select pizza_category , sum(quantity ) as Total_Pizzas_Sold from pizza_sales group by pizza_category order by Total_Pizzas_Sold Desc;

-- Q11.	Find Top 5 Pizzas sold  by Revenue
select  pizza_name , sum(total_price) as Total_Revenue  from pizza_sales group by pizza_name order by Total_Revenue desc limit 5;

-- Q12.	Find Bottom 5 Pizzas sold  by Revenue
select  pizza_name , sum(total_price) as Total_Revenue  from pizza_sales group by pizza_name order by Total_Revenue asc limit 5;

-- Q13.	Find Top 5 Pizzas Sold by Quantity
select  pizza_name , sum(quantity) as Total_Pizza_Sold  from pizza_sales group by pizza_name order by Total_Pizza_Sold desc limit 5;

-- Q14.	Find Bottom 5 Pizzas sold by Qunatity
select  pizza_name , sum(quantity) as Total_Pizza_Sold  from pizza_sales group by pizza_name order by Total_Pizza_Sold asc limit 5;

-- Q15. Find Top 5 Pizzas sold by Total_Orders
select  pizza_name , count(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by Total_Orders desc limit 5;

-- Q16. Find Bottom 5 Pizzas sold  by Total Orders
select  pizza_name , count(distinct order_id) as Total_Orders from pizza_sales group by pizza_name order by Total_Orders asc limit 5;

