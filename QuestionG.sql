#g. The number of orders and total amount each employee has sold.
SELECT employees.employee_firstName, COUNT(products_orders.quantity), COUNT(total)
FROM orders
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN products_orders ON employees.employee_id = products_orders.order_id
GROUP BY employees.employee_id;
