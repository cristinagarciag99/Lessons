-- 2.09 LAB QUERIES 9 --
use sakila;

-- 1) Create a table `rentals_may` to store the data from rental table with information for the month of May.
select * from sakila.rental;

-- Crear querie que irá dentro de la tabla:
select *
from sakila.rental
where month(rental_date) = 5;

-- Crear tabla:
create table sakila.rental_may as
select *
from sakila.rental
where month(rental_date) = 5;

select * from sakila.rental_may;


-- 2) Insert values in the table `rentals_may` using the table rental, filtering values only for the month of May.
-- Hecho en el 1


-- 3) Create a table `rentals_june` to store the data from rental table with information for the month of June.
create table sakila.rental_june as
select *
from sakila.rental
where month(rental_date) = 6;

select * from sakila.rental_june;

-- 4) Insert values in the table `rentals_june` using the table rental, filtering values only for the month of June.
-- Hecho en el 3


-- 5) Check the number of rentals for each customer for May.
select customer_id, count(rental_id) 
from sakila.rental_may
group by customer_id;


-- 6) Check the number of rentals for each customer for June.
select customer_id, count(rental_id) 
from sakila.rental_june
group by customer_id;


-- 7) Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
--    - Check the number of rentals for each customer for May
--    - Check the number of rentals for each customer for June
--    **Hint**: You can store the results from the two queries in two separate dataframes.
-- Hecho en el 6)

-- 8) Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
--    **Hint**: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the [merge function]



