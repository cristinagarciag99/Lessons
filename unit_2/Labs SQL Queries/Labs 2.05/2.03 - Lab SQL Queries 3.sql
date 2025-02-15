-- 2.03 LAB SQL QUERIES 3 --
use sakila;

-- 1
select count(distinct last_name)
from actor;

-- 2
select count(distinct language_id)
from film;

-- 3
select count(*)
from film
where rating = "PG-13";

-- 4
select title, length
from film
where release_year = 2006
order by length desc
limit 10;

-- 5
select datediff(max(rental_date), min(rental_date)) as active_days
from rental;

-- 6
select *, date_format(rental_date, '%M') as month , date_format(rental_date, '%W') as weekday
from rental
limit 20;

-- 7
select *, case when date_format(rental_date, '%W') in ('Saturday', 'Sunday')
          then 'weekend'
          else 'workday' end as day_type
from rental;

-- 8
select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date))
from rental;

select count(*)
from rental
where date(rental_date) between date('2006-01-15') and date('2006-02-14');