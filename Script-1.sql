-- I'm also pasting the questions to make grading easier
-- I did not know if I should capitalize everything since DBeaver makes everything lowercase, but I did it anyway
-- I'm also only using knowledge that was covered in the video and the linked document, as per the instructions


-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(DISTINCT actor_id) as whalbergs
FROM actor
WHERE last_name LIKE 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, count(inventory_id) AS amount_in_stock
-- My result was a bit different from the expected output on the assignemnt though, so this might be wrong
-- Although I did go back and counted how many times film 200 appears, but it only appeared 8 times
FROM inventory
GROUP BY film_id
ORDER BY amount_in_stock DESC;
-- It's in descending order, so the film with the most in stock will be on top


-- 4. How many customers have the last name ‘William’?
SELECT count(DISTINCT last_name) AS williams
FROM customer
WHERE last_name LIKE 'William';


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, count(DISTINCT rental_id) AS rentals_sold
FROM rental
GROUP BY staff_id
order by rentals_sold desc


-- 6. How many different district names are there?
SELECT count(DISTINCT district) AS total_distinct_districts
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(actor_id) AS actors_in_film
FROM film_actor
GROUP BY film_id
ORDER BY actors_in_film DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT count(DISTINCT customer_id) AS customers_with_last_names_ending_in_es
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(amount) AS number_of_rentals
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(amount) > 250;


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, count(rating) AS total_movies
FROM film
WHERE rating IS NOT null
GROUP BY rating 
ORDER BY total_movies DESC



