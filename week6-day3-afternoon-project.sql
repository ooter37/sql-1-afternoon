--Table - person
--1
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
    height INTEGER,
    city TEXT,
    favorite_color TEXT
);
--2
INSERT INTO person (name, age, height, city, favorite_color)
VALUES
('Derek', 34, 183, 'Everett', 'green'),
('Meghan', 32, 168, 'Green Bay', 'red'),
('Eloise', 2, 94, 'Phoenix', 'pink'),
('Leo', 12, 46, 'Flagstaff', 'yellow'),
('Harriet', 3, 15, 'Unknown', 'black');
--3
SELECT * FROM person
ORDER BY height DESC;
--4
SELECT * FROM person
ORDER BY height ASC;
--5
SELECT * FROM person
ORDER BY age DESC;
--6
SELECT * FROM person
WHERE age >= 20;
--7
SELECT * FROM person
WHERE age = 18;
--8
SELECT * FROM person
WHERE age > 20 AND age < 40;
--9
SELECT * FROM person
WHERE age != 27;
--10
SELECT * FROM person
WHERE favorite_color != 'red';
--11
SELECT * FROM person
WHERE favorite_color != 'red' AND favorite_color != 'blue';
--12
SELECT * FROM person
WHERE favorite_color = 'orange' OR favorite_color = 'green';
--13
SELECT * FROM person
WHERE favorite_color IN ('orange', 'green', 'blue');
--14
SELECT * FROM person
WHERE favorite_color IN ('yellow', 'purple');

--Table - orders
--1
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    person_id INTEGER,
    product_name TEXT,
    product_price NUMERIC,
    quantity INTEGER
);
--2
INSERT INTO orders (person_id, product_name, product_price, quantity)
VALUES
(1, 'cheese', 9.87, 3),
(2, 'milk', 1.99, 1),
(3, 'egg', 4.50, 12),
(2, 'bread', 4.03, 2),
(1, 'car', 57485.00, 1);
--3
SELECT * FROM orders;
--4
SELECT sum(quantity) FROM orders;
--5
SELECT sum(quantity * product_price) FROM orders;
--6
SELECT sum(quantity * product_price) FROM orders
WHERE person_id = 1;

--Table - artist
--1
INSERT INTO artist (name) 
VALUES
('cheeseman'),
('pickleboat'),
('chickenleaf');
--2
SELECT * FROM artist ORDER BY name DESC LIMIT 10;
--3
SELECT * FROM artist ORDER BY name LIMIT 5;
--4
SELECT * FROM artist
WHERE name LIKE 'Black%';
--5
SELECT * FROM artist
WHERE name LIKE '%Black%';

--Table -- employee
--1
SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';
--2
SELECT min(birth_date) FROM employee;
--3
SELECT max(birth_date) FROM employee;
--4
SELECT * FROM employee
WHERE reports_to = 2;
--5
SELECT count(*) FROM employee
WHERE city = 'Lethbridge';

--Table -- invoice
--1
SELECT count(*) FROM invoice
WHERE billing_country = 'USA';
--2 I know I can use max() but I'm trying to spice things up a bit
SELECT * FROM invoice ORDER BY total DESC LIMIT 1;
--3
SELECT * FROM invoice ORDER BY total ASC LIMIT 1;
--4 
SELECT * FROM invoice 
WHERE total > 5;
--5
SELECT count(*) FROM invoice 
WHERE total < 5;
--6
SELECT count(*) FROM invoice 
WHERE billing_state IN ('CA', 'TX', 'AZ');
--7
SELECT avg(total) FROM invoice;
--8
SELECT sum(total) FROM invoice ;