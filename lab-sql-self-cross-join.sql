-- Lab | SQL Self and cross join

USE sakila;

-- 1.  Get all pairs of actors that worked together. SELFOIN 

SELECT * FROM film_actor;

SELECT fa1.actor_id as actor1, fa2.actor_id as actor2, f.title 
FROM film_actor as fa1
JOIN film_actor as fa2
ON fa1.film_id = fa2.film_id AND fa1.actor_id != fa2.actor_id
INNER JOIN film as f   -- Joining film table to get film title
ON fa2.film_id = f.film_id;


-- 2. Get all pairs of customers that have rented the same film more than 3 times.


SELECT i.film_id, r1.customer_id as cust1, r2.customer_id as cust2, COUNT(r1.rental_id) as total_rentings_same_film
FROM rental as r1
JOIN rental as r2
ON r1.inventory_id = r2.inventory_id
JOIN inventory as i   #Adding Inventory to add film_id
ON r2.inventory_id = i.inventory_id AND r1.customer_id != r2.customer_id
GROUP BY i.film_id, r1.customer_id, r2.customer_id
HAVING total_rentings_same_film >= 2; 
-- No pair of customers that have rented same film more than 3 times, only 1 pair 2 times.


-- 3. Get all possible pairs of actors and films.
-- CROSSJOIN

SELECT a.first_name, a.last_name, f.title
FROM actor as a
CROSS JOIN film as f;



