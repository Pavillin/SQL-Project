#a. All orders, items grouped by customer
SELECT order_id, items.item_name
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;

#b. All customers, orders, and reviews ordered by review date (newest first).
SELECT customers.first_name, customers.last_name, orders.order_id, reviews.fiveStarRating FROM customers
INNER JOIN orders ON customers.customer_id=orders.customer_id
INNER JOIN products_orders ON products_orders.order_id = orders.order_id
INNER JOIN products ON products.product_id = products_orders.product_id
INNER JOIN product_review ON product_review.product_review_id = products.product_id
INNER JOIN reviews ON reviews.review_id = product_review.product_review_id
ORDER BY review_date DESC;

#c. All customers and orders, sorted by price of orders highest first.
SELECT customers.first_name, orders.order_id
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY orders.total DESC;

#d. All the people who have spent the most money. You cannot use LIMIT in case there are more than one customer.


#e. Display the item(s) that is the most popular. You cannot use LIMIT.


#f. Find the average cost of an order.
SELECT ROUND(AVG(total),2)
FROM orders;


#g. The number of orders and total amount each employee has sold.
#SELECT COUNT(), COUNT()

#h. Determine which employee has the highest sales to customer ratio. Meaning add up all the sales of the employee and divided by the number 
#	of unique customers.


#i. Two queries of your own choosing that has not been used in this assignment so far. Create a comment to describe what your query is finding.
# 1) All customers that have not ordered
SELECT last_name, first_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id
                FROM orders
                GROUP BY customer_id);
                
# 2) 
