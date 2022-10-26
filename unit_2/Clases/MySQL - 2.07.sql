-- 2.07 --
use bank;

-- USING AGGREGATE FUNCTIONS WITH "GROUP BY" CLAUSE (ON A SINGLE COLUMN)
-- Find the average balances for the different statuses of people whi have taken loans
-- step 1:
select round(avg(amount),2) as "Avg Amount", round(avg(payments),2) as "Avg Payment", status
from bank.loan
group by status
order by status;

-- step 2:
select round(avg(amount),2) - round(avg(payments),2) as "Avg Balance", status
from bank.loan
group by status
order by status;

-- Find the average amount of transactions for each different kind of k_symbol
select round(avg(amount),2) as Average, k_symbol from bank.order
group by k_symbol
order by Average asc;
-- whichever `k_symbol` was empty, those values were also aggregated. We can remove those values by using a simple filter on it.

select round(avg(amount),2) as Average, k_symbol from bank.order
where k_symbol<> ' '
group by k_symbol
order by Average asc;

-- Same query with NOT operator:
select round(avg(amount),2) as Average, k_symbol from bank.order
where not k_symbol = ' '
group by k_symbol
order by Average asc;


-- 2.07 ACTIVITY 1 --
use bank;

-- 1) Find out how many cards of each type have been issued
select type as card_type, count(*) as num_issued
from bank.card
group by type
order by num_issued desc;

-- 2) Find out how many customers there are by district
select district_id, count(*) as num_customers
from bank.client
group by district_id
order by num_customers desc;

-- 3) Find out average transaction valued by type 
select type, round(avg(amount),2) as avg_amount
from bank.trans
group by type
order by avg_amount desc;


-- USING AGGREGATE FUNCTIONS WITH "GROUP BY" CLAUSE (MORE EXAMPLES: GROUPING MORE THAN 1 COLUMN)
select round(avg(amount),2) - round(avg(payments),2) as "Avg Balance", status, duration
from bank.loan
group by status, duration
order by status, duration;

select round(avg(amount),2) - round(avg(payments),2) as "Avg Balance", status, duration
from bank.loan
group by status, duration
order by duration, status;

-- Query without "order by" clause:
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
group by type, operation, k_symbol;

-- Query with "order by" clause:
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
group by type, operation, k_symbol
order by type, operation, k_symbol;


-- 2.07 ACTIVITY 2 --
-- In the previous query there are 19 rows returned, but a few places where columns "k_symbol" is an empty string
-- Task: use a filter to remove those rows of data. After that, number of rows should have been reduced. 
select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
where k_symbol <> '' and k_symbol <> ' '
group by type, operation, k_symbol
order by type, operation, k_symbol;


-- USING "GROUP BY" AND "HAVING" CLAUSES TOGETHER
select type, operation, k_symbol, round(avg(balance),2) as Average
from bank.trans
where k_symbol <> '' and k_symbol <> ' ' and  operation <> ''
group by type, operation, k_symbol
having Average > 30000
order by type, operation, k_symbol;

-- Not the most efficient way of using the HAVING clause:
select type, operation, k_symbol, round(avg(balance),2) as Average
from bank.trans
where k_symbol <> '' and k_symbol <> ' '
group by type, operation, k_symbol
having operation <> ''
order by type, operation, k_symbol;

-- Using the same query as before
select round(avg(amount),2) - round(avg(payments),2) as Avg_Balance, status, duration
from bank.loan
group by status, duration
having Avg_Balance > 100000
order by duration, status;


-- 2.07 ACTIVITY 3 --
use bank;

-- 1) Find the districts with more than 100 clients.
select district_id, count(*) num_customers
from bank.client
group by district_id
having num_customers > 100
order by num_customers desc;

-- 2) Find the transactions (type, operation) with a mean amount greater than 10000.
select type, operation, round(avg(amount),2) as avg_amount
from bank.trans
group by type, operation
having avg_amount>10000
order by avg_amount desc;


-- WINDOW FUNCTIONS "OVER()" AND "PARTITION BY ()"
select loan_id, account_id, amount, payments, duration, amount-payments as "Balance",
avg(amount-payments) over (partition by duration) as Avg_Balance
from bank.loan
where amount > 100000
order by duration, balance desc;

-- You can also have ORDER BY clause followed by partition by as shown below:
select loan_id, account_id, amount, payments, duration, amount-payments as "Balance",
avg(amount-payments) over (partition by duration order by duration asc, amounts desc) as Avg_Balance
from bank.loan
where amount > 100000;