use sqlproject;		/*Tell MySQL which database to use*/
#use gcc200344974;	/*keon db*/

DROP TABLE IF EXISTS product_review;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS products_orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

/*table for customers*/
CREATE TABLE customers 
(
	customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(100),
	email_address VARCHAR(60) NOT NULL
);

/*table for employees*/
CREATE TABLE employees 
(
	employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL
);

/*table for orders*/
CREATE TABLE orders 
(
	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	date DATE NOT NULL,
	total DEC(10,2),
	customer_id INT,
    employee_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

/*Table for products*/
CREATE TABLE products 
(
	product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	description VARCHAR(8000),
	price DECIMAL(10,2)
);

/*make junction table for products and orders*/
CREATE TABLE products_orders(
	products_orders_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantity INT,
	product_id INT,
	order_id INT,
	FOREIGN KEY(product_id) REFERENCES products(product_id),
	FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

/*Table for reviews*/
CREATE TABLE reviews 
(
	review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fiveStarRating INT(1) NOT NULL,
    review_date DATE NOT NULL
);

/*Junction table for reviews and products*/
CREATE TABLE product_review (
product_review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_id INT NOT NULL,
review_id INT NOT NULL, 
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);


INSERT INTO customers (first_name, last_name, address, email_address) VALUES
    ('Nancy', 'Huber', '3613 Park Ct', 'NancyRHuber@spambob.com'),
    ('Christine', 'Santos', '669 Granville St','ChristineJSantos@dodgit.com'),
    ('Elizabeth', 'Weatherford','2539 Lockhart Drive', 'ElizabethGWeatherford@mailinator.com'),
    ('Richard', 'Wilson', '1932 Davis Drive', 'RichardRWilson@trashymail.com');
    
INSERT INTO employees(firstName, lastName) VALUES
	('Bob', 'Smith'),
    ('Mac', 'Donald'),
	('Joe', 'Fresh');
    
INSERT INTO products(product_name, description, price) VALUES
	('Hockey Stick', 'Used to control the puck', 99.99),
    ('Shoulder Pads', 'A layer of protection', 69.50),
    ('Helmet', 'Protects head from collisions with an impact-absorbing EPP liner', 55.99),
    ('Shin Pads', 'Shin Guards provide a natural, close-to-the-body fit that helps protect players', 32.99),
	('Skates', 'Cut through the ice with speed and agility', 85.00);
    
INSERT INTO orders VALUES	/* orders must have 15-20 entries */
	(1,'2012-11-11',100,1,1),
	(2,'2010-12-10',200,2,2),
	(3,'2011-12-15',300,3,3),
	(4,'2011-9-11',400,4,3),
	(5,'2013-8-7',500,1,2),
	(6,'2013-7-1',100,2,1),
	(7,'2014-6-2',200,3,2),
	(8,'2015-5-4',300,4,1),
	(9,'2015-4-19',400,1,3),
	(10,'2016-3-17',500,2,2),
	(11,'2016-2-5',100,3,1),
	(12,'2017-1-4',200,4,2),
	(13,'2017-6-1',300,1,3),
	(14,'2018-11-11',400,2,2),
	(15,'2018-11-10',500,3,1),
	(16,'2018-10-9',100,4,1),
	(17,'2016-12-6',200,1,2),
	(18,'2014-10-5',300,2,3);
    
INSERT INTO products_orders VALUES (1,1,1,1);
INSERT INTO products_orders VALUES (2,4,2,2);
INSERT INTO products_orders VALUES (3,6,3,3);
INSERT INTO products_orders VALUES (4,2,4,4);
INSERT INTO products_orders VALUES (5,6,1,5);
INSERT INTO products_orders VALUES (6,9,2,6);
INSERT INTO products_orders VALUES (7,1,3,7);
INSERT INTO products_orders VALUES (8,6,4,8);
INSERT INTO products_orders VALUES (9,2,1,9);
INSERT INTO products_orders VALUES (10,7,2,10);
INSERT INTO products_orders VALUES (11,4,3,11);
INSERT INTO products_orders VALUES (12,1,4,12);
INSERT INTO products_orders VALUES (13,4,1,13);
INSERT INTO products_orders VALUES (14,1,2,14);
INSERT INTO products_orders VALUES (15,5,3,15);
INSERT INTO products_orders VALUES (16,2,4,16);
INSERT INTO products_orders VALUES (17,1,1,17);
INSERT INTO products_orders VALUES (18,2,2,18);

INSERT INTO reviews(fiveStarRating, review_date) VALUES
	(5, '2012-6-11'),
    (3, '2013-4-21'),
    (2, '2014-7-1'),
    (3, '2014-1-6'),
	(4, '2015-12-19');


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