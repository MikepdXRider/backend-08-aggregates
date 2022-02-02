-- customer ranking by total amount spent
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order
SELECT 
	customer.email,
    RANK() OVER (ORDER BY SUM(payment.amount) DESC)
FROM
	payment
INNER JOIN
    rental
ON
    payment.rental_id = rental.rental_id
INNER JOIN
	customer
ON 
	rental.customer_id = customer.customer_id
GROUP BY 
    customer.email