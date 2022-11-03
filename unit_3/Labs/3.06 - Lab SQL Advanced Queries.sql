-- 3.06 LAB SQL ADVANCED QUERIES --
use sakila;

-- 1) List each pair of actors that have worked together
select fa1.film_id, concat(a1.first_name, ' ', a1.last_name), concat(a2.first_name, ' ', a2.last_name)
from sakila.actor a1
inner join film_actor fa1 on a1.actor_id = fa1.actor_id
inner join film_actor fa2 on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
inner join actor a2 on a2.actor_id = fa2.actor_id
limit 10;

-- 2) For each film, list the actor that has acted in more films
with actor_movies as (
  select actor_id, count(film_id) as num_films
  from film_actor
  group by actor_id
)
select * from actor_movies
limit 10;


select * from film_actor
limit 1;


with actor_movies as (
  select actor_id, count(film_id) as num_films
  from film_actor
  group by actor_id
)

select f.title, concat(a.first_name, ' ', a.last_name) as best_actor
from (
        select film_id, actor_id, rank() over (partition by film_id
                                               order by actor_movies.num_films desc) as m
        from film_actor
        inner join actor_movies
        using (actor_id)
     ) as t

inner join actor a on t.actor_id = a.actor_id
inner join film f on t.film_id = f.film_id
where m = 1
limit 10;

