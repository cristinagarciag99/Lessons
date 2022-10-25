-- 3.02 LAB SQL JOINS ON MULTIPLE TABLES --
use sakila;

-- 1) Write a query to display for each store its store ID, city, and country.
select store_id, city, country
from sakila.store
join (sakila.address join (sakila.city join sakila.country using (country_id)) using (city_id)) using (address_id);

-- 2) Write a query to display how much business, in dollars, each store brought in.
select store.store_id, round(sum(amount), 2)
from sakila.store join (sakila.customer join (sakila.payment join sakila.rental using (rental_id)) on customer.customer_id = payment.customer_id) using (store_id)
group by store.store_id;

-- 3) What is the average running time of films by category?
select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
                 join sakila.category using (category_id)
group by category.name
order by avg(length) desc;

-- 4) Which film categories are longest?
select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
                 join sakila.category using (category_id)
group by category.name
order by avg(length) desc;

-- 5) Display the most frequently rented movies in descending order.
select title, count(*) as `rental frequency`
from sakila.film
join (sakila.inventory join sakila.rental using (inventory_id))
using (film_id)
group by title
order by `rental frequency` desc
limit 10;

-- 6) List the top five genres in gross revenue in descending order.
select name, category_id, sum(amount) as `gross revenue`
from sakila.payment
join (sakila.rental join (sakila.inventory join (sakila.film_category join sakila.category using (category_id)) using (film_id)) using (inventory_id)) using (rental_id)
group by category_id
order by `gross revenue` desc
limit 5;

-- 7) Is "Academy Dinosaur" available for rent from Store 1?
select film.film_id, film.title, store.store_id, inventory.inventory_id
from sakila.inventory
join sakila.store using (store_id)
join sakila.film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

