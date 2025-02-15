-- 3.01 LAB SQL JOIN --

-- 1) number of films per category
select name as category_name, count(*) as num_films
from sakila.category
inner join sakila.film_category
using (category_id)
group by name
order by num_films desc
limit 10;

-- 2) display the first and last names, as well as the address, of each staff member
select staff.first_name, staff.last_name, address.address
from sakila.address
inner join sakila.staff
on staff.address_id = address.address_id;

-- 3) display the total amount rung up by each staff member in August of 2005
select s.staff_id, concat(s.first_name,' ',s.last_name) as employee, sum(p.amount) as `total amount`
from sakila.staff as s
inner join sakila.payment as p
on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id;

-- 4) List each film and the number of actors who are listed for that film
select title as `film title`, count(actor_id) as `number of actors`
from sakila.film
inner join sakila.film_actor
on film.film_id = film_actor.film_id
group by film.film_id
limit 10;

-- 5) list the total paid by each customer
select first_name, last_name, sum(amount) as "total amount paid"
from sakila.customer
inner join sakila.payment
on customer.customer_id = payment.customer_id
group by customer.customer_id
order by last_name
limit 10;

