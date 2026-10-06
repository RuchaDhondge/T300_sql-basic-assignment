-- ==========================================
-- Online Bookstore Database Assignment
-- ==========================================

CREATE DATABASE IF NOT EXISTS bookstore_db;
USE bookstore_db;

-- ------------------------------------------
-- Schema Setup: Authors and Books Tables
-- ------------------------------------------

DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    price DECIMAL(10,2),
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Insert Sample Data into Authors (5 authors)
INSERT INTO Authors (author_id, author_name, country) VALUES
(1, 'Robert C. Martin', 'USA'),
(2, 'Erich Gamma', 'Switzerland'),
(3, 'J.K. Rowling', 'UK'),
(4, 'Ashlee Vance', 'South Africa'),
(5, 'Yuval Noah Harari', 'Israel');

-- Insert Sample Data into Books (10 books)
INSERT INTO Books (book_id, title, author_id, category, price, published_year) VALUES
(101, 'Clean Code', 1, 'Programming', 850.00, 2008),
(102, 'Design Patterns', 2, 'Programming', 950.00, 1994),
(103, 'Harry Potter and the Philosophers Stone', 3, 'Fiction', 450.00, 1997),
(104, 'Elon Musk', 4, 'Biography', 650.00, 2015),
(105, 'Sapiens', 5, 'History', 750.00, 2011),
(106, 'Clean Architecture', 1, 'Programming', 890.00, 2017),
(107, 'Harry Potter and the Chamber of Secrets', 3, 'Fiction', 480.00, 1998),
(108, 'Homo Deus', 5, 'History', 780.00, 2015),
(109, 'System Design Interview', 1, 'Programming', 920.00, 2021),
(110, 'Steve Jobs', 4, 'Biography', 600.00, 2011);

-- ==========================================
-- Section 1: Basic Queries
-- ==========================================

-- Task 1: Display all books.
SELECT * FROM Books;

-- Task 2: Display only the book title and price.
SELECT title, price FROM Books;

-- Task 3: Display the book title as Book Name and price as Book Price using column aliases.
SELECT title AS `Book Name`, price AS `Book Price` FROM Books;

-- Task 4: Display all unique book categories.
SELECT DISTINCT category FROM Books;

-- ==========================================
-- Section 2: Filtering Data
-- ==========================================

-- Task 5: Display books priced above ₹700.
SELECT * FROM Books WHERE price > 700;

-- Task 6: Display books priced between ₹500 and ₹800.
SELECT * FROM Books WHERE price BETWEEN 500 AND 800;

-- Task 7: Display books that belong to the Programming category.
SELECT * FROM Books WHERE category = 'Programming';

-- Task 8: Display books whose titles start with the letter S.
SELECT * FROM Books WHERE title LIKE 'S%';

-- Task 9: Display books published after 2020.
SELECT * FROM Books WHERE published_year > 2020;

-- ==========================================
-- Section 3: Sorting and Limiting Results
-- ==========================================

-- Task 10: Display books sorted by price in descending order.
SELECT * FROM Books ORDER BY price DESC;

-- Task 11: Display the top 3 most expensive books.
SELECT * FROM Books ORDER BY price DESC LIMIT 3;

-- ==========================================
-- Section 4: Aggregate Functions
-- ==========================================

-- Task 12: Find Total number of books, Total price, Average price, Highest price, and Lowest price.
SELECT 
    COUNT(*) AS total_books,
    SUM(price) AS total_price,
    AVG(price) AS avg_price,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM Books;

-- ==========================================
-- Section 5: GROUP BY and HAVING
-- ==========================================

-- Task 13: Display the average book price for each category.
SELECT category, AVG(price) AS avg_price
FROM Books
GROUP BY category;

-- Task 14: Display only those categories whose average book price is greater than ₹650.
SELECT category, AVG(price) AS avg_price
FROM Books
GROUP BY category
HAVING AVG(price) > 650;

-- ==========================================
-- Section 6: Joins
-- ==========================================

-- Task 15: Display each book along with its author's name using an INNER JOIN.
SELECT b.book_id, b.title, a.author_name, b.category, b.price
FROM Books b
INNER JOIN Authors a ON b.author_id = a.author_id;

-- Task 16: Display all authors along with the books they have written using a LEFT JOIN.
SELECT a.author_name, b.title, b.category, b.price
FROM Authors a
LEFT JOIN Books b ON a.author_id = b.author_id;

-- Task 17: Display all books along with their author details using a RIGHT JOIN.
SELECT b.title, a.author_name, a.country
FROM Books b
RIGHT JOIN Authors a ON b.author_id = a.author_id;

-- ==========================================
-- Section 7: Data Manipulation
-- ==========================================

-- Task 18: Insert a new book into the Books table.
INSERT INTO Books (book_id, title, author_id, category, price, published_year)
VALUES (111, 'Temporary Test Book', 1, 'Programming', 500.00, 2023);

-- Task 19: Update the price of the book you inserted.
UPDATE Books
SET price = 550.00
WHERE book_id = 111;

-- Task 20: Delete the book record that you inserted.
DELETE FROM Books
WHERE book_id = 111;

-- ==========================================
-- Section 8: Creating Tables and Constraints
-- ==========================================

DROP TABLE IF EXISTS Publishers;
-- Task 21: Create a new table named Publishers with required constraints.
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) DEFAULT 'India',
    established_year INT NOT NULL
);
