use gcc200344974;		/*Tell MySQL which database to use*/

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers 
(
	customerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(100),
	email_address VARCHAR(60) NOT NULL
);

CREATE TABLE orders 
(
	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	date DATE NOT NULL,
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE items 
(


);

CREATE TABLE employees 
(
	employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL
);

CREATE TABLE reviews 
(
	fiveStarRating INT (1)
	/*FOREIGN KEY (product_id) REFERENCES products(product_id),*/
);

INSERT INTO customers (first_name, last_name, address, email_address) VALUES
    ('Nancy', 'Huber', '3613 Park Ct', 'NancyRHuber@spambob.com'),
    ('Christine', 'Santos', '669 Granville St','ChristineJSantos@dodgit.com'),
    ('Elizabeth', 'Weatherford','2539 Lockhart Drive', 'ElizabethGWeatherford@mailinator.com'),
    ('Richard', 'Wilson', '1932 Davis Drive', 'RichardRWilson@trashymail.com');


#a. All orders, items grouped by customer


#b. All customers, orders, and reviews ordered by review date (newest first).


#c. All customers and orders, sorted by price of orders highest first.


#d. All the people who have spent the most money. You cannot use LIMIT in case there are more than one customer.


#e. Display the item(s) that is the most popular. You cannot use LIMIT.


#f. Find the average cost of an order.


#g. The number of orders and total amount each employee has sold.


#h. Determine which employee has the highest sales to customer ratio. Meaning add up all the sales of the employee and divided by the number 
#	of unique customers.


#i. Two queries of your own choosing that has not been used in this assignment so far. Create a comment to describe what your query is finding.