-- Compute the change in retained customers from month to month
-- Step 1:
select * from bank.retained_customers;

-- Step 2: 
select 
   Activity_year,
   Activity_month,
   Retained_customers, 
   lag(Retained_customers, 1) over(partition by Activity_year) as Lagged
from retained_customers;

-- Final Step:
select
	Activity_year,
    Activity_month, 
   (Retained_customers-lag(Retained_customers, 1) over(partition by Activity_year)) as Diff
from retained_customers;