/* 
QUESTION: Do we have any peak hours for the number of orders recieved? 
ANSWER: Peak hour: 1200. TOP 3 PEAK HOUR (respectively): 1200, 1300, and 1800. 
*/ 

SELECT DATEPART(hh, time) AS PeakHour, COUNT(DISTINCT pizzaplace.dbo.order_details.order_id) AS OrderByHour
-- DATEPART seperates the time to only have hour 
-- We want to count the distinct number of orders to determine how many orders in an hour 
From PizzaPlace.dbo.orders 
INNER JOIN PizzaPlace.dbo.order_details 
ON PizzaPlace.dbo.orders.order_id = pizzaplace.dbo.order_details.order_id

GROUP BY DATEPART(hh, time)
ORDER BY OrderByHour DESC
-- Group by the hour, with the orders per hour descending to see the top number of order by hour. 