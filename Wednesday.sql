1.SELECT COUNT (id) 
FROM orders where category_id = 2;

2.SELECT COUNT(id) 
FROM orders where category_id in (2,4,5)

3.SELECT COUNT (id) 
FROM `orders` where price > 35.00

4.SELECT COUNT (id)
FROM orders where date_of_birth < 1980-01-01 
and newsletter = 1
	
5.SELECT COUNT （customer_surname）*
FROM orders 
WHERE customer_surname = 'Davenport'

6.SELECT customer_firstname, customer_surname
FROM orders
WHERE customer_surname like 'Br%' 
GROUP BY customer_firstname, customer_surname
HAVING count(*) = 
(
	SELECT MAX(t.c)
	FROM
	(
		SELECT count(*) as c
		FROM orders as x
		WHERE x.customer_surname like 'Br%' 
		GROUP BY x.customer_firstname, x.customer_surname
	) as t
);

-- or

SELECT customer_firstname, customer_surname
FROM orders
WHERE customer_surname like 'Br%' 
GROUP BY customer_firstname, customer_surname
ORDER BY count(*) DESC
LIMIT 1

7.Select*
FROM orders
WHERE category_id = 3
ORDER BY price DESC

8.SELECT `trans_date` as 'Transaction Date', `price` as 'Price', `promo_code` as 'Promotion Code'
FROM `orders`

9.SELECT CONCAT(UPPER(`customer_surname`),' ', `customer_firstname`) as 'Customer name' ,
`county` as 'County'
FROM `orders`

10.SELECT `category_id`,
AVG(`price`), MIN(`price`) , MAX(`price`) 
FROM `orders` 
GROUP BY `category_id`

11.SELECT categories.category_name as 'Category',
SUM (CONVERT(orders.price,DECIMAL)) AS 'Total Orders',
COUNT (*) AS 'Total Sales'
FROM orders LEFT OUTER JOIN categories ON orders.category_id = categories.id
GROUP BY category_id

12.SELECT orders.trans_date AS 'Transaction Date',
categories.category_name AS 'Category',
orders.customer_surname AS 'Surname', 
orders.customer_firstname AS 'Firstname', 
orders.price AS 'Order Price', 
categories.category_name AS 'Category', 
promotions.discount AS 'Discounted by'
FROM categories,orders LEFT OUTER JOIN promotions ON orders.promo_code = promotions.code
WHERE category_id = categories.id