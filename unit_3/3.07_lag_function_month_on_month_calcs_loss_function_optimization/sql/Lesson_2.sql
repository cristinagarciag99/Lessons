/*
Getting the total number of UNIQUE active customers for each year-month.
*/

-- Step 1: Get the unique account_id every year, month, and month_number
select distinct account_id as Active_id, Activity_year, Activity_month, Activity_month_number from bank.user_activity;

--  Step 2: Create a view with the previous information
drop view bank.distinct_users;
create view bank.distinct_users as
select distinct account_id as Active_id, Activity_year, Activity_month, Activity_month_number from bank.user_activity;

-- Check results
select * from bank.distinct_users;

-- Final step: Do a cross join for the previous view but with the following restrictions:
-- 1)-The Active_id MUT exist in the second table
-- 2)-The Activity_month should be shifted by one.
select 
   d1.Activity_year,
   d1.Activity_month,
   d1.Activity_month_number,
   count(distinct d1.Active_id) as Retained_customers
   from bank.distinct_users as d1
join bank.distinct_users as d2
on d1.Active_id = d2.Active_id 
and d2.Activity_month_number = d1.Activity_month_number + 1 
group by d1.Activity_year, d1.Activity_month_number
order by d1.Activity_year, d1.Activity_month_number;

-- Create a view to store the results of previous query
drop view if exists bank.retained_customers;
create view bank.retained_customers as 
select 
   d1.Activity_year,
   d1.Activity_month,
   count(distinct d1.Active_id) as Retained_customers
   from bank.distinct_users as d1
join bank.distinct_users as d2
on d1.Active_id = d2.Active_id 
and d2.Activity_month_number = d1.Activity_month_number + 1 
group by d1.Activity_year, d1.Activity_month_number
order by d1.Activity_year, d1.Activity_month_number;

select * from bank.retained_customers;