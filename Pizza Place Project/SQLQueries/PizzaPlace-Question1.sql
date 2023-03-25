/* 
QUESTION: How many orders per day do we have? 
*/ 
SELECT date, COUNT(DISTINCT pizzaplace.dbo.orders.order_id) AS CountOfOrders
From PizzaPlace.dbo.orders 
INNER JOIN PizzaPlace.dbo.order_details 
ON PizzaPlace.dbo.orders.order_id = pizzaplace.dbo.order_details.order_id

GROUP BY date
ORDER BY date 