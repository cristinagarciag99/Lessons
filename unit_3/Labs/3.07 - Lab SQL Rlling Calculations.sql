-- 3.07 LAB SQL ROLLING CALCULATIONS --
use sakila;

-- 1) Get the number of monthly active customers
with customer_activity as (
  select customer_id, convert(rental_date, date) as Activity_date,
  date_format(convert(rental_date,date), '%Y') as Activity_year,
  date_format(convert(rental_date,date), '%M') as Activity_Month,
  date_format(convert(rental_date,date), '%m') as Activity_Month_Number
  from sakila.rental
)
select count(distinct customer_id) as Active_users, Activity_year, Activity_Month
from customer_activity
group by Activity_year, Activity_Month_Number
order by Activity_year, Activity_Month_Number;


-- 2) Get active users in the previous month
with customer_activity as (
  select customer_id, convert(rental_date, date) as Activity_date,
  date_format(convert(rental_date,date), '%Y') as Activity_year,
  date_format(convert(rental_date,date), '%M') as Activity_Month,
  date_format(convert(rental_date,date), '%m') as Activity_Month_Number
  from sakila.rental
),
monthly_active_users as (
  select count(distinct customer_id) as Active_users, Activity_year, Activity_Month_Number
  from customer_activity
  group by Activity_year, Activity_Month_Number
  order by Activity_year, Activity_Month_Number
),
cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month, Activity_year, Activity_Month_Number  from monthly_active_users
)
select * from cte_activity
where last_month is not null;


-- 3) Get the percentage change in the number of active customers
with customer_activity as (
  select customer_id, convert(rental_date, date) as Activity_date,
  date_format(convert(rental_date,date), '%Y') as Activity_year,
  date_format(convert(rental_date,date), '%M') as Activity_Month,
  date_format(convert(rental_date,date), '%m') as Activity_Month_Number
  from sakila.rental
),
monthly_active_users as (
  select count(distinct customer_id) as Active_users, Activity_year, Activity_Month_Number
  from customer_activity
  group by Activity_year, Activity_Month_Number
  order by Activity_year, Activity_Month_Number
),
cte_activity as (
  select Active_users, lag(Active_users,1) over (partition by Activity_year) as last_month, Activity_year, Activity_Month_Number
  from monthly_active_users
)
select (Active_users-last_month)/Active_users*100 as percentage_change, Activity_year, Activity_Month_Number
from cte_activity
where last_month is not null;


-- 4) Get retained customers every month
with customer_activity as (
  select customer_id, convert(rental_date, date) as Activity_date,
  date_format(convert(rental_date,date), '%M') as Activity_Month,
  date_format(convert(rental_date,date), '%Y') as Activity_year,
  convert(date_format(convert(rental_date,date), '%m'), UNSIGNED) as month_number
  from sakila.rental
),
distinct_users as (
  select distinct customer_id , Activity_month, Activity_year, month_number
  from customer_activity
)
select count(distinct d1.customer_id) as Retained_customers, d1.Activity_month, d1.Activity_year
from distinct_users d1
join distinct_users d2
on d1.customer_id = d2.customer_id and d1.month_number = d2.month_number + 1
group by d1.Activity_month, d1.Activity_year
order by d1.Activity_year, d1.month_number;
