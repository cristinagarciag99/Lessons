-- 2.04 LAB SQL QUERIES 4 --
use sakila;

-- 1) Get film ratings
select rating, title from sakila.film;

-- 2) Get release years
select title, release_year from sakila.film;

-- 3) Get all films with ARMAGEDDON in the title
select title from sakila.film
where title regexp '^ARMAGEDDON';

-- 4) Get all films with APOLLO in the title
select distinct title from sakila.film
where title regexp '^APOLLO';

-- 5) Get all films which title ends with APOLLO
select distinct title from sakila.film
where title regexp 'APOLLO$';

-- 6) Get all films with word DATE in the title
select distinct title from sakila.film
where title regexp 'DATE';

-- 7) Get 10 films with the longest title
select title
from sakila.film
order by length desc
limit 10;

-- 8) Get 10 the longest films
select title, length
from sakila.film
order by length desc
limit 10;

-- 9) How many films include **Behind the Scenes** content?
select count(*) from sakila.film
where status in ('special_features');

-- 10) List films ordered by release year and title in alphabetical order.
select title, release_year from sakila.film
order by title asc;