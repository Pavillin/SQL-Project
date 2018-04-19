use gcc200344974;		/*Tell MySQL which database to use*/

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers 
(
	customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	address VARCHAR(100),
	email_address VARCHAR(60) NOT NULL
);

CREATE TABLE items 
(
	item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    price DEC(4,2)
);

CREATE TABLE orders 
(
	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	order_date DATETIME NOT NULL, /*the date that the the order was put in*/
	total DEC(6,4) NOT NULL DEFAULT 0,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(item_id) REFERENCES items(item_id)
);

CREATE TABLE employees 
(
	employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL
);

CREATE TABLE reviews 
(
	fiveStarRating INT (1),
	FOREIGN KEY (item_id) REFERENCES products(item_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

/*Not sure if we need this */
CREATE TABLE order_items 
(
    id         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (first_name, last_name, address, email_address) VALUES
    ('Nancy', 'Huber', '3613 Park Ct', 'NancyRHuber@spambob.com'),
    ('Christine', 'Santos', '669 Granville St','ChristineJSantos@dodgit.com'),
    ('Elizabeth', 'Weatherford','2539 Lockhart Drive', 'ElizabethGWeatherford@mailinator.com'),
    ('Richard', 'Wilson', '1932 Davis Drive', 'RichardRWilson@trashymail.com');
    
INSERT INTO items(item_name, description, price) VALUES
	('Hockey Stick', 'Used to control the puck', 99.99),
    ('Shoulder Pads', 'A layer of protection', 69.50),
    ('Helmet', 'Protects head from collisions with an impact-absorbing EPP liner', 55.99),
    ('Shin Pads', 'Shin Guards provide a natural, close-to-the-body fit that helps protect players', 32.99),
	('Skates', 'Cut through the ice with speed and agility', 85.00);
    
INSERT INTO orders(order_date, total) VALUES	/* orders must have 15-20 entries */
	('2011-11-11'),
	('2014-10-5');


INSERT INTO employees(firstName, lastName) VALUES
	('Bob', 'Smith'),
    ('Mac', 'Donald'),
	('Joe', 'Fresh');

INSERT INTO reviews(fiveStarRating) VALUES
	(5),
	(2);


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