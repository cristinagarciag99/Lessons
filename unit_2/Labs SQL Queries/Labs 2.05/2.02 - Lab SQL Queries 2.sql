-- 2.02 LAB SQL QUERIES 2 --
use sakila;

-- 1) Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = 'Scarlett';

-- 2) Select all the actors with the last name ‘Johansson’.
select * from sakila.actor
where last_name = 'Johansson';

-- 3) How many films (movies) are available for rent?
select count(inventory_id) from sakila.inventory;

-- 4) How many films have been rented?
select count(rental_id) from sakila.rental;

-- 5) What is the shortest and longest rental period?
select max(rental_duration) from sakila.film;
select min(rental_duration) from sakila.film;

-- 6) What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.
select max(length) as max_duration, min(length) as min_duration from sakila.film;

-- 7) What's the average movie duration?
select avg(length) as average_length from sakila.film;

-- 8) What's the average movie duration expressed in format (hours, minutes)?
select avg(length/60) from sakila.film;

-- 9) How many movies are longer than 3 hours?
select count(length) from sakila.film
where length > 180;

-- 10) Get the name and email formatted. Example: Mary SMITH - *mary.smith@sakilacustomer.org*.
select concat(left(first_name,1), lower(substr(first_name,2)), ' ', last_name) as customer_name,
    lower(email) as email
from sakila.customer;

-- 11) What's the length of the longest film title?
select max(length(title)) as longest_title from sakila.film;
