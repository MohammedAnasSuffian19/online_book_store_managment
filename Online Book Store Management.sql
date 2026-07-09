-- Online Book Store Management
-- Database Creation
CREATE DATABASE IF NOT EXISTS OnlineBookStore;

USE OnlineBookStore;

-- Tables creation
-- First table(books)
CREATE TABLE books(
	book_id	INT PRIMARY KEY,
	title VARCHAR(100),
	author VARCHAR(100),
	genre VARCHAR(50),	
	published_year INT,
	price DECIMAL(10,2),
	stock INT
);

-- Second table(customers)
CREATE TABLE customers(
	customer_id	INT PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100),	
	phone VARCHAR(15),
	city VARCHAR(50),
	country VARCHAR(150)
);

-- Third table(orders)
CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	customer_id INT,
	book_id INT,
	order_date DATE,
	quantity INT,
	total_amount DECIMAL(10,2),
	CONSTRAINT fk FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	CONSTRAINT fk1 FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Verify table creation
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- Imported datasets for the tables
# Datasets: book.csv, customers.csv, orders.csv

-- Solving Queries:
-- 1) Retrieve all books in the "Fiction" genre
SELECT * FROM books
WHERE genre = 'Fiction';

-- 2) Find books published after the year 1950
SELECT * FROM books
WHERE published_year > 1950;

-- 3) List all customers from the Canada
SELECT * FROM customers
WHERE country = 'Canada';

-- 4) Show orders placed in November 2023
SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available
SELECT SUM(stock) AS total_stock FROM books;

-- 6) Find the details of the most expensive book
SELECT * FROM books 
ORDER BY price DESC LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT * FROM orders 
WHERE quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20
SELECT * FROM orders 
WHERE total_amount > 20;

-- 9) List all genres available in the Books table
SELECT DISTINCT(genre) FROM books;

-- 10) Find the book with the lowest stock
SELECT * FROM books 
ORDER BY stock LIMIT 1;

-- 11) Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- 12) Find the average price of books in the "Fantasy" genre
SELECT AVG(price) AS average_price 
FROM books 
WHERE genre = 'Fantasy';

-- 13) Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC 
LIMIT 3;

-- 14) Retrieve the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b
ON o.book_id = b.book_id
GROUP BY b.genre;

-- 15) Retrieve the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b
ON o.book_id = b.book_id
GROUP BY b.author;

-- 16) List customers who have placed at least 2 orders
SELECT o.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(order_id) >= 2;

-- 17) Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS
order_quantity,
b.stock - COALESCE(SUM(o.quantity),0) AS remaining_quantity
FROM books b
LEFT JOIN orders o
ON b.book_id=o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;
