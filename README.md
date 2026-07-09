# Online Book Store Management System

A beginner-to-intermediate **SQL project** built using **MySQL** that simulates an **Online Book Store Management System**. The project demonstrates database design, relationships, data import, and SQL queries covering filtering, joins, aggregation, grouping, and reporting.

---

## Project Overview

This project manages the basic operations of an online bookstore through three relational tables:

- **Books**
- **Customers**
- **Orders**

It demonstrates the use of **Primary Keys**, **Foreign Keys**, **Joins**, **Aggregate Functions**, and other SQL concepts to solve real-world business queries.

---

## Database Schema

### Books

| Column | Data Type |
|---------|-----------|
| book_id | INT (Primary Key) |
| title | VARCHAR(100) |
| author | VARCHAR(100) |
| genre | VARCHAR(50) |
| published_year | INT |
| price | DECIMAL(10,2) |
| stock | INT |

### Customers

| Column | Data Type |
|---------|-----------|
| customer_id | INT (Primary Key) |
| name | VARCHAR(100) |
| email | VARCHAR(100) |
| phone | VARCHAR(15) |
| city | VARCHAR(50) |
| country | VARCHAR(150) |

### Orders

| Column | Data Type |
|---------|-----------|
| order_id | INT (Primary Key) |
| customer_id | INT (Foreign Key) |
| book_id | INT (Foreign Key) |
| order_date | DATE |
| quantity | INT |
| total_amount | DECIMAL(10,2) |

---

## Entity Relationship

```text
Customers
    │
    │ customer_id
    ▼
Orders
    ▲
    │ book_id
    │
Books
```

---

## Technologies Used

- MySQL
- SQL
- MySQL Workbench

---

## Dataset

The project uses the following CSV files:

- `books.csv`
- `customers.csv`
- `orders.csv`

These datasets are imported after creating the tables.

---

## SQL Concepts Covered

- Database Creation
- Table Creation
- Primary Keys
- Foreign Keys
- Data Import
- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT
- Aggregate Functions
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- COALESCE()

---

## Business Queries Solved

| No. | Query |
|-----|-------|
| 1 | Retrieve all Fiction books |
| 2 | Find books published after 1950 |
| 3 | List customers from Canada |
| 4 | Show orders placed in November 2023 |
| 5 | Calculate total stock available |
| 6 | Find the most expensive book |
| 7 | Show orders with quantity greater than 1 |
| 8 | Retrieve orders with total amount greater than $20 |
| 9 | List all available genres |
| 10 | Find the book with the lowest stock |
| 11 | Calculate total revenue |
| 12 | Find the average price of Fantasy books |
| 13 | Retrieve the top 3 most expensive Fantasy books |
| 14 | Calculate total books sold for each genre |
| 15 | Calculate total books sold by each author |
| 16 | List customers who placed at least two orders |
| 17 | Calculate remaining stock after fulfilling all orders |

---

## Learning Outcomes

This project demonstrates practical knowledge of:

- Relational Database Design
- SQL Query Writing
- Data Filtering
- Joins
- Aggregate Functions
- Grouping and Reporting
- Inventory Analysis
- Revenue Analysis

---

## Future Improvements

- Add a Publishers table
- Add Categories table
- Implement Stored Procedures
- Create Views for reports
- Add Triggers for automatic stock updates
- Create Indexes for query optimization

## Author

**Mohammed Anas Suffian**

Computer Science Engineering (AI & ML)

**Skills:** SQL • MySQL • Python • Data Analysis

---
