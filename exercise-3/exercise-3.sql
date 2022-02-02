-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount
SELECT 
	country.country,
    AVG(payment.amount) AS avg
FROM
    payment
INNER JOIN
    customer
ON
    payment.customer_id = customer.customer_id
INNER JOIN
	address
ON
	customer.address_id = address.address_id
INNER JOIN
	city
ON
	address.city_id = city.city_id
INNER JOIN
	country
ON
	city.country_id = country.country_id
GROUP BY 
	country.country_id
ORDER BY 
	avg desc
LIMIT(10)