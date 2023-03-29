CREATE DATABASE PizzaToppings;

USE PizzaToppings;

CREATE TABLE  PizzaToppingsPrice 
(	
    ToppingName VARCHAR(30) , 
    IngredientCost DECIMAL(10,2)
);

SELECT * FROM PizzaToppingsPrice;

INSERT INTO PizzaToppingsPrice (ToppingName, IngredientCost) 
VALUES ('Pepperoni', 0.50),
	   ('Sausage', 0.70),
	   ('Chicken', 0.55),
	   ('Extra Cheese', 0.40);

SELECT * FROM PizzaToppingsPrice;

SELECT t1.ToppingName AS Topping1, t2.ToppingName AS Topping2, t3.ToppingName AS Topping3, 
       ROUND((t1.IngredientCost + t2.IngredientCost + t3.IngredientCost), 2) AS TotalCost
FROM PizzaToppingsPrice t1
JOIN PizzaToppingsPrice t2 ON t1.ToppingName < t2.ToppingName
JOIN PizzaToppingsPrice t3 ON t2.ToppingName < t3.ToppingName
ORDER BY TotalCost DESC, Topping1, Topping2, Topping3 ASC;
