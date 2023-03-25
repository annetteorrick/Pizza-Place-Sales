/* 
QUESTION 3, PART 1: How much money did we make this year? 
*/ 

SELECT ROUND(SUM(price * quantity), 2) AS 'Gross Income For 2015'
FROM PizzaPlace.dbo.pizzas 
INNER JOIN PizzaPlace.dbo.order_details 
ON PizzaPlace.dbo.pizzas.pizza_id = PizzaPlace.dbo.order_details.pizza_id; 



/* 
QUESTION 3, PART 2: Can we identify any seasonality in the sales? 
*/ 

SELECT 
CASE 
WHEN date BETWEEN '2015-01-01' AND '2015-02-28' THEN 'Winter'
WHEN date BETWEEN '2015-03-01' AND '2015-05-31' THEN 'Spring'
WHEN date BETWEEN '2015-06-01' AND '2015-08-31' THEN 'Summer'
WHEN date BETWEEN '2015-09-01' AND '2015-11-30' THEN 'Fall'
WHEN date BETWEEN '2015-12-01' AND '2015-12-31' THEN 'Winter'
END AS Seasons,
ROUND(SUM(price * quantity), 2) AS 'Gross Income Per Season'
FROM PizzaPlace.dbo.pizzas
INNER JOIN PizzaPlace.dbo.order_details
ON PizzaPlace.dbo.order_details.pizza_id = PizzaPlace.dbo.pizzas.pizza_id
INNER JOIN PizzaPlace.dbo.orders 
ON PizzaPlace.dbo.order_details.order_id = PizzaPlace.dbo.orders.order_id 

GROUP BY CASE 
WHEN date BETWEEN '2015-01-01' AND '2015-02-28' THEN 'Winter'
WHEN date BETWEEN '2015-03-01' AND '2015-05-31' THEN 'Spring'
WHEN date BETWEEN '2015-06-01' AND '2015-08-31' THEN 'Summer'
WHEN date BETWEEN '2015-09-01' AND '2015-11-30' THEN 'Fall'
WHEN date BETWEEN '2015-12-01' AND '2015-12-31' THEN 'Winter'
END; 
