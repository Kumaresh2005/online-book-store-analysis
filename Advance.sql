
-- Retrieve the total number of books sold for each genre
select b.Genre,sum(o.Quantity) as total_sold
from books b
join orders o
on b.Book_ID= o.Book_ID
group by b.Genre;

-- Find the average price of books in the "Fantasy" genre
select avg(Price) as avg_price_Fantasy_genre
from books
where Genre="Fantasy";

-- List customers who have placed at least 2 orders
SELECT o.customer_id,
c.name,
COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- Find the most frequently ordered book
select b.Book_ID,
b.Title,
count(o.Order_ID) as total_orders
from books b
join orders o
on b.Book_ID= o.Book_ID
group by b.Book_ID, b.Title
order by count(o.Order_ID) desc
limit 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre

select b.Book_ID,b.Title,b.Price
from books b
where b.Genre="Fantasy"
order by b.Price desc
limit 3;

-- Retrieve the total quantity of books sold by each author
select b.Author,sum(o.Quantity) as Total_quantity
from books b
join orders o
on b.Book_ID= o.Book_ID
group by b.Author
order by Total_quantity desc;

-- List the cities where customers who spent over $30 are located
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;

-- Find the customer who spent the most on orders
select c.customer_id,
c.Name,
sum(o.Total_Amount) as Total_spend
from customers c
join orders o 
on c.Customer_ID= c.Customer_ID
group by c.customer_id,c.Name
order by Total_spend
limit 1;

-- Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;







