-- 3.01 JOINS ON 2 TABLES --
use bank;

-- 3.01.1. SQL-PYTHON --
select * 
from loan
limit 10;

-- SQL Line Magic
select * from loan limit 10;


-- 3.01.2. JOINS --
select * from bank.account
limit 5;

select * from bank.loan
limit 5;

-- In SQL, default is INNER JOIN, so we can swap right and left tables without effect
select * from bank.loan l
join bank.account a
on l.account_id = a.account_id
limit 5; 

select * from bank.account a 
join bank.loan l 
on a.account_id = l.account_id
limit 5;

-- But if we perform a LEFT JOIN the difference is huge:
select * from bank.loan l
left join bank.account a
on l.account_id = a.account_id
limit 5;

select * from bank.account a
left join bank.loan l
on a.account_id = l.account_id
limit 5;

-- And the same is true for a RIGHT JOIN:
select * from bank.loan l
right join bank.account a
on l.account_id = a.account_id
limit 5;

select * from bank.account a
right join bank.loan l
on a.account_id = l.account_id
limit 5;

-- EXAMPLE 1: write a query to extract information from the "client" and "district" tables to get info of all clients of the city and region they are from:
-- Step 1)
select * from bank.client c
join district d
on c.district_id = d.A1
limit 5;

-- Step 2)
select c.client_id, c.birth_number, c.district_id, d.A2, d.A3
from bank.client c
join bank.district d
on c.district_id = d.A1
limit 5;


-- EXAMPLE 2: write queries to extract info about the accounts:
-- a) retuning "account_id", "operation", "frequency", sum of amount, sum of balance
-- b) where the balance is over 1000
-- c) "operation" type is "VKLAD" and
-- d) that have aggregated amount of over 500,000

-- Step 1)
select * from bank.trans t 
left join bank.account a
on t.account_id = a.account_id
limit 2;

-- Step 2)
select * from bank.trans t 
left join bank.account a
on t.account_id = a.account_id
where t.operation = 'VKLAD'
and t.balance > 1000
limit 2;

-- Step 3)
select t.account_id, t.operation, a.frequency, sum(t.amount) as TotalAmount, sum(t.balance) as TotalBalance
from bank.trans as t
left join bank.account as a
on t.account_id = a.account_id
where t.operation = 'VKLAD'
and t.balance > 1000
group by t.account_id, t.operation, a.frequency
limit 2;

-- Step 4)
select t.account_id, t.operation, a.frequency, sum(t.amount) as TotalAmount, sum(t.balance) as TotalBalance
from bank.trans t
left join bank.account a
on t.account_id = a.account_id
where t.operation = 'VKLAD'
and t.balance > 1000
group by t.account_id, t.operation, a.frequency
having TotalAmount > 500000
order by TotalAmount desc
limit 10;


-- 3.01 ACTIVITY 4 --
-- 1) Create a list of all clients together with region and district, ordered by region and district
select c.client_id, d.A3, d.A2
from bank.district as d
inner join bank.client as c
on c.district_id = d.A1
order by d.A3, d.A2
limit 3;

-- 2) Count how many client do we have per region and district
select count(client_id) from bank.client;

select d.A3 as Region, d.A2 as District, count(c.client_id) as num_clients 
from bank.district as d
inner join bank.client as c
on c.district_id = d.A1
group by d.A3, d.A2
order by d.A3, d.A2
limit 3;

-- 3) Add to the previous query the number of clients per 10000 inhabitants
select d.A3, d.A2, count(c.client_id) as client_number, round(10000*count(c.client_id)/d.A4) as clients_per_10000  
from bank.district as d
inner join bank.client as c
on c.district_id = d.A1
group by d.A3, d.A2
order by d.A3, d.A2
limit 3;