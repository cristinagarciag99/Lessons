-- 2.05 LAB SQL QUERIES 5 --
-- 1) Drop column "picture" from "staff"
alter table sakila.staff drop column picture;

-- 2) A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from sakila.customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

insert into sakila.staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'tammy')

-- 3) Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
-- get customer_id
select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- expected customer_id = 130

-- get film_id
select film_id from sakila.film where title 0 'ACADEMY DINOSAUR';
-- expected film_id = 1

-- get inventory_id
select inventory_id from sakila.inventory where film_id = 1;
-- expected inventory_id = 1

-- get staff_id
select * from sakila.staff;
-- expected staff_id = 1

insert into sakila.rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), 1, 130, 1);

-- 4) Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps
-- check the current number of inactive users
select * from sakila.customer
where active = 0;

drop table if exists deleted_users;

CREATE TABLE deleted_users (
customer_id int UNIQUE NOT NULL,
email varchar(255) UNIQUE NOT NULL,
delete_date date
);

insert into deleted_users
select customer_id, email, curdate()
from sakila.customer
where active = 0;

select * from deleted_users;

delete from sakila.customer where active = 0;

-- check how many inactive users there are now
select * from skila.customer
where active = 0;

