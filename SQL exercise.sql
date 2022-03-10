-- 1. How many orders were received for products with a category_id = 2

SELECT COUNT (id) 
FROM orders where category_id = 2;

-- 2.How many orders were received with a category_id of either 2, 4, or 5

SELECT COUNT(id) 
FROM orders where category_id in (2,4,5)

-- 3. How many order are there with a price over £35.00

SELECT COUNT (id) 
FROM `orders` where price > 35.00

-- 4.How many orders are there where the customer has a date of birth before 1st January 1980 and want to receive the newsletter
SELECT COUNT (id)
FROM orders where date_of_birth < 1980-01-01 
and newsletter = 1
	
-- 5.How many customers named Davenport placed orders?
SELECT COUNT （customer_surname）*
FROM orders 
WHERE customer_surname = 'Davenport'

-- 6.Which customer with a firstname starting with 'Br', had the most orders

SELECT customer_firstname, customer_surname
FROM orders
WHERE customer_surname like 'Br%' 
GROUP BY customer_firstname, customer_surname
ORDER BY count(*) DESC
LIMIT 1

-- 7.List all orders with products from category 3 by order of price, highest first.
Select*
from orders
where category_id = 3
order by price DESC



--  8.Select the following fields from all orders (trans_date, price, promo_code) renaming the colum (field) headings ('Transaction Date', 'Price' & 'Promotion Code')

SELECT `trans_date` as 'Transaction Date', `price` as 'Price', `promo_code` as 'Promotion Code'
FROM `orders`

-- 9) Select the following fields (customer_surname, customer_firstname, county) from all orders, with customer names in a single field named 'Customer Name' and in the format <Surname>, <Firstname>, with surname capitalised.  The county field is to be renamed 'County'.

SELECT CONCAT(UPPER(`customer_surname`),' ', `customer_firstname`) as 'Customer name' ,
`county` as 'County'
FROM `orders`

-- 10)	Select the average price, minimum price & maximum price for each category.

SELECT `category_id`,
AVG(`price`), MIN(`price`) , MAX(`price`) 
FROM `orders` 
GROUP BY `category_id`

-- 11) 	Select the category_name (labelled 'Category', number of sales (labelled 'Total Orders') & total sales (labelled 'Total Sales') for each category.

-- 12) 	List all orders with the following fields (with the labls given) orders.trans_date('Transaction Date'), categories.category_name('Category'), orders.customer_surname('Surname'), orders.customer_firstname('Firstname'), orders.price('Order Price'), categories.category_name('Category'), promotions.discount('Discounted by') 




