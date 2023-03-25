
/* 
PART 1
QUESTION: How many pizzas are typically in an order?  
ANSWER: Output - Pizza Count Per Order Number
*/ 
SELECT order_id, COUNT(quantity) AS PizzaCountPerOrder
FROM PizzaPlace.dbo.order_details 
GROUP BY order_id
Order by order_id
-- Part 1 END 


/* 
PART 2 - Best Sellers By Size of Pizza
QUESTION: Do we have any bestseller pizzas? 
*/ 
SELECT order_details.pizza_id, COUNT(quantity) AS BestSellersBySize
From PizzaPlace.dbo.order_details
INNER JOIN PizzaPlace.dbo.pizzas
ON pizzaplace.dbo.order_details.pizza_id = pizzaplace.dbo.pizzas.pizza_id

GROUP BY order_details.pizza_id
Order by BestSellersBySize DESC 
-- List shows bestseller pizzas in order from most sold pizzas to least sold pizzas based on size

-- Part 2 END 


-- Part 3 - Best Sellers By Name of Pizza
-- Trying to display best sellers as name, joining 3 tables together to display name of pizza instead of pizza type
-- now showing pizza type id instead of pizza size with type 
-- Do I need to have a 'distinct' count for my order id? 
-- No, right... because there can be a multiple number of pizzas in an order and we want to count all of those pizzas and then group by the pizza_type_id 

SELECT name AS PizzaName, Count(order_id) AS PizzasPerType
FROM PizzaPlace.dbo.order_details 
INNER JOIN PizzaPlace.dbo.pizzas 
ON PizzaPlace.dbo.order_details.pizza_id = pizzaplace.dbo.pizzas.pizza_id 
INNER JOIN Pizzaplace.dbo.pizza_types 
ON PizzaPlace.dbo.pizzas.pizza_type_id = pizzaplace.dbo.pizza_types.pizza_type_id 

GROUP BY name
ORDER BY PizzasPerType DESC


-- Part 4: Best Sellers Grouped By Category 

SELECT category, name AS PizzaName, Count(order_id) AS PizzasPerType
FROM PizzaPlace.dbo.order_details 
INNER JOIN PizzaPlace.dbo.pizzas 
ON PizzaPlace.dbo.order_details.pizza_id = pizzaplace.dbo.pizzas.pizza_id 
INNER JOIN Pizzaplace.dbo.pizza_types 
ON PizzaPlace.dbo.pizzas.pizza_type_id = pizzaplace.dbo.pizza_types.pizza_type_id 

GROUP BY category, name 
ORDER BY category, PizzasPerType DESC; 