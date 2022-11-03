-- 3.08 LAB SQL MAKING PREDICITONS WITH LOGISTIC REGRESSION --
use sakila;

-- 1 Create a query or queries to extract the information you think may be relevant
-- for building the prediction model. It should include some film features and some rental features.
select i.film_id, avg(p.amount) avg_rental_cost,
case when timestampdiff(hour, r.rental_date, r.return_date) regexp '^[0-9]+$'
then avg(timestampdiff(hour, r.rental_date, r.return_date))
else 0
end as avg_hours_rented, count(ifnull(r.rental_id, 0)) num_rent
from rental r
join payment p on p.rental_id = r.rental_id
join inventory i on i.inventory_id = r.inventory_id
group by film_id;

select
  f.film_id,
  f.title,
  f.description,
  fc.category_id,
  f.language_id,
  avg(f.rental_duration) * 24 avg_hours_rental_allowed,
  f.length / 60 hours_length,
  avg(f.replacement_cost) avg_replacement_cost,
  f.rating,
  f.special_features,
  count(fa.actor_id) actors_in_film
from film f
join film_category fc on fc.film_id = f.film_id
join film_actor fa on fa.film_id = f.film_id
group by f.film_id;

select rental_id, film_id, rental_date, rank() over (partition by film_id order by rental_date desc) recent
from film left join inventory using (film_id) left join rental using (inventory_id)
order by film_id
-- where rental_date > '2006-03-01';