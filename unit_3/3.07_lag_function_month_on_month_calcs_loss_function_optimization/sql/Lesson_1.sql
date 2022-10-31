/*
Determine the number of 'Active users' as: those customers who were doing
transactions every month. 
Therefore, we need to look at the 'trans' table for
accounts_id (every account corresponds to one client). 
*/

-- Step 1: Get the account_id, date, year, month and month_number for
-- every transaction. 
create or replace view user_activity as
select account_id, convert(date, date) as Activity_date,
date_format(convert(date,date), '%M') as Activity_Month,
date_format(convert(date,date), '%m') as Activity_Month_number,
date_format(convert(date,date), '%Y') as Activity_year
from bank.trans;

-- Checking results
select * from bank.user_activity;

-- Step 2:
-- Computing the total number of active users by Year and Month with group by
-- and sorting according to year and month NUMBER.
select Activity_year, Activity_Month, count(account_id) as Active_users from bank.user_activity
group by Activity_year, Activity_Month
order by Activity_year asc, Activity_Month_number asc;

-- Step 3:
-- Storing the results on a view for later use.
drop view bank.monthly_active_users;
create view bank.monthly_active_users as
select Activity_year, Activity_Month, Activity_Month_number, count(account_id) as Active_users from bank.user_activity
group by Activity_year, Activity_Month
order by Activity_year asc, Activity_Month_number asc;

-- Sanity check
select * from monthly_active_users;


/*
-- Final step:
Compute the difference of `active_users` between one month and the previous one
for each year
using the lag function with lag = 1 (as we want the lag from one previous record)
*/

select 
   Activity_year, 
   Activity_month,
   Active_users, 
   lag(Active_users,1) over (order by Activity_year, Activity_Month_number) as Last_month
from monthly_active_users;

-- Refining: Getting the difference of monthly active_users month to month.
with cte_view as (select 
   Activity_year, 
   Activity_month,
   Active_users, 
   lag(Active_users,1) over (order by Activity_year, Activity_Month_number) as Last_month
from monthly_active_users)
select Activity_year, Activity_month, Active_users, Last_month, (Active_users - Last_month) as Difference from cte_view;
