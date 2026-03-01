 
-- Retrieve all books in the "Fiction" genre
select Title,Author,Genre
from books 
where books.Genre="Fiction";

-- Find books published after the year 1950
select * 
from books 
where books.Published_Year>1950;

-- List all customers from the Canada 
select *
from customers
where Country="Canada";

-- Show orders placed in November 2023
select*
from orders 
where month(Order_Date)=11;

-- Retrieve the total stock of books available
select sum(Stock) as Total_stock
from books;

-- Find the details of the most expensive book
select *
from books
where Price=(
select max(Price)
from books);

-- Show all customers who ordered more than 1 quantity of a book
select c.*,o.Quantity
from customers c
inner join orders o
on c.Customer_id = o.Customer_id
where o.Quantity>1
order by o.Quantity;

-- Retrieve all orders where the total amount exceeds $20
SELECT *
FROM orders
WHERE total_amount > 20;

-- List all genres available in the Books table
select distinct Genre
from books;

-- Find the book with the lowest stock
select *
from books
where Stock=(
select min(Stock)
from books);

-- Calculate the total revenue generated from all orders
select sum(Total_Amount) as Total_reveneu
from orders;



