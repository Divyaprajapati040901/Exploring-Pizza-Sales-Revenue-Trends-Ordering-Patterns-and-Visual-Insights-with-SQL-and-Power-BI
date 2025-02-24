-- RETRIVE THE TOTAL NUMBER OF ORDER PLACES

-- select count(order_id) as total_orders from orders;


-- CALCULATE THE TOTAL REVENUE GENERATED FROM PIZZA SALES

-- SELECT 
--     ROUND(SUM(order_details.quantity * pizzas.price),
--             2) AS total_sales
-- FROM
--     order_details
--         JOIN
--     pizzas ON pizzas.pizza_id = order_details.pizza_id;
--   




-- IDENTIFY THE HIGHEST PRICE OF PIZZAS

-- SELECT 
--     pizza_types.name, pizzas.price
-- FROM
--     pizzas
--         JOIN
--     pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
-- ORDER BY pizzas.price DESC
-- LIMIT 1;



-- identify the most common pizza size order

-- SELECT 
--     pizzas.size,
--     COUNT(order_details.order_details_id) AS order_count
-- FROM
--     pizzas
--         JOIN
--     order_details ON pizzas.pizza_id = order_details.pizza_id
-- GROUP BY pizzas.size
-- ORDER BY order_count DESC;






-- LIST THE TOP 5 MOST ORDERED PIZZA TYPE ALONG WITH THEIR QUANITY 

-- SELECT 
--     SUM(order_details.quantity) AS QUANTITY,
--     (pizza_types.name) AS TYPE_OF_PIZZA
-- FROM
--     order_details
--         JOIN
--     pizzas ON order_details.pizza_id = pizzas.pizza_id
--         JOIN
--     pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
-- GROUP BY TYPE_OF_PIZZA
-- ORDER BY QUANTITY DESC
-- LIMIT 5;



-- JOIN THE NECESSARY TABLE TO FIND THE TOTAL QUANTITY OF EACH PIZZA CATEGORY ORDERED

-- SELECT 
--     SUM(order_details.quantity) AS TOTAL_PIZZA,
--     (pizza_types.category) AS CATEGORY
-- FROM
--     order_details
--         JOIN
--     pizzas ON order_details.pizza_id = pizzas.pizza_id
--         JOIN
--     pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
-- GROUP BY CATEGORY
-- ORDER BY TOTAL_PIZZA DESC;


-- DETERMINE THE DISTRIBUTION OF ORDERS BY HOUR OF THE DAY

-- SELECT 
--     HOUR(time) as HOUR, COUNT(order_id) AS ORDER_COUNT
-- FROM
--     orders
-- GROUP BY HOUR(time);


-- JOIN RELEVENT TABLES TO FIND THE CATEGORY WISE DISTRIBUTION OF PIZZAS

-- SELECT 
--     COUNT(name) AS PIZZA_TYPE, category
-- FROM
--     pizza_types
-- GROUP BY category
-- ORDER BY PIZZA_TYPE DESC;



-- GROUP THE ORDERS BY DATE AND CALCULATE THE AVERAGE NUMBER OF PIZZAS ORDERED PER DAY

-- SELECT 
--     ROUND(AVG(QUANTITY))
-- FROM
--     (SELECT 
--         orders.date, SUM(order_details.quantity) AS QUANTITY
--     FROM
--         orders
--     JOIN order_details ON order_details.order_id = orders.order_id
--     GROUP BY date) AS QUANTITY_ORDER;




-- DETERMINE THE  TOP 3 MOST ORDERD PIZZA TYPES BASED ON REVENUE

-- SELECT 
--     pizza_types.name,
--     ROUND(SUM(pizzas.price * order_details.quantity),
--             0) AS REVENUE
-- FROM
--     order_details
--         JOIN
--     pizzas ON order_details.pizza_id = pizzas.pizza_id
--         JOIN
--     pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
-- GROUP BY name
-- order by REVENUE DESC limit 3




-- CALCULATE THE PERCENTAGE CONTRIBUTION OF EACH PIZZA TYPE TO TOTAL REVENUE

SELECT 
    pizza_types.category,
(pizzas.price * order_details.quantity) / (SELECT ROUND(SUM(pizzas.price * order_details.quantity),2) AS TOTAL_SALES
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id) * 100
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY category
order by TOTAL_SALES DESC 


