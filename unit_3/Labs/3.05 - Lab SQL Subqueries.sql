-- 3.05 LAB SUBQUERIES --
use sakila;

-- 1) How many copies of the film _Hunchback Impossible_ exist in the inventory system?
select count(*) as Copies from sakila.inventory as i
join sakila.film as f
on i.film_id = f.film_id
where title = 'HUNCHBACK IMPOSSIBLE';

-- 2) List all films whose length is longer than the average of all the films.
select title, length from sakila.film
where length > (
  select avg(length) from sakila.film
)
limit 10;

-- 3) Use subqueries to display all actors who appear in the film _Alone Trip_.
select Actor from
(select fa.film_id, fi.title, fa.actor_id, concat(a.first_name,' ',a.last_name) as Actor from sakila.film_actor as fa
join sakila.actor as a 
on fa.actor_id = a.actor_id
join sakila.film as fi
on fa.film_id = fi.film_id) as s
where title = 'ALONE TRIP';

-- 4) Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from
(select f.title, c.name as Category from sakila.film as f
join sakila.film_category as fc
on f.film_id = fc.film_id
join sakila.category as c
on fc.category_id = c.category_id) as s
where Category = "Family"
limit 10;

-- 5) Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select concat(first_name , ' ' , last_name) as Customer_Name, email
from sakila.customer
where address_id in (
  select address_id
  from sakila.address
  where city_id in (
    select city_id
    from sakila.city
    where country_id in (
      select country_id
      from sakila.country
      where country = 'Canada'
     )
  )
);

-- 6) Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
-- a) Get the most prolific actor:
select actor_id from (
	select actor_id, count(film_id) as Films from sakila.film_actor
  group by actor_id
  order by Films desc
  limit 1) as s;

-- b) Get the films starred by the mosr prolific actor:
select fi.title from sakila.film_actor as fa 
join sakila.film as fi
on fa.film_id = fi.film_id
where actor_id = (
  select actor_id from (
    select actor_id, count(film_id) as Films from sakila.film_actor
    group by actor_id
    order by Films desc
  limit 1) 
as s1)
limit 10;

-- 7) Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
-- a) Get the most profitable customer:
select customer_id from (
  select customer_id, sum(amount) as Payments from sakila.payment
  group by customer_id
  order by Payments desc
  limit 1) 
as s;

-- b) Get films rented by most profitable customer:
select title from (select pa.customer_id, pa.rental_id, re.inventory_id, i.film_id, fi.title  from sakila.payment as pa
join sakila.rental as re
on pa.rental_id = re.rental_id
join sakila.inventory as i
on re.inventory_id = i.inventory_id
join sakila.film as fi
on i.film_id = fi.film_id) as s1
where customer_id = (select customer_id from (select customer_id, sum(amount) as Payments from sakila.payment
group by customer_id
order by Payments desc
limit 1) as s2)
limit 10;

-- 8) Get the `client_id` and the `total_amount_spent` of those clients who spent more than the average of the `total_amount` spent by each client.
select customer_id, sum(amount) as Customer_total_spent from sakila.payment
group by customer_id
having Customer_total_spent > (select round(avg(Customer_total_payment),2) as Average from (select customer_id, round(sum(amount),2) as Customer_total_payment from sakila.payment
group by customer_id) as s)
order by Customer_total_spent desc
limit 10;
