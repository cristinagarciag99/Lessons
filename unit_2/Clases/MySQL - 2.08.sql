-- 2.08.1 SQL - PYTHON --
use bank;

select *
from loan
limit 10;

select *
from loan
limit :L;


-- 2.08.2 WINDOW FUNCTIONS --
-- Rank over amount (without partition):
select *, rank() over (order by amount desc) as 'Rank'
from bank.loan
limit 10;

select *, row_number() over (order by amount desc) as 'Row Number'
from bank.loan
limit 3;

select * , rank() over (partition by k_symbol order by amount desc) as "Ranks"
from bank.order
where k_symbol <> " ";

-- Difference between RANK and DENSE_RANK:
select *, rank() over(order by amount asc) as 'RANK'
from bank.order
where k_symbol <> ' ';

select *, dense_rank() over(order by amount asc) as 'DENSE_RANK'
from bank.order;
-- While using RANK the ties are assigned the same rank and the next ranking is skipped
-- However with DENSE_RANK we get consecutive ranks without any skips


-- 2.08.3 JOINS --
select count(distinct account_id) from bank.account;

select count(distinct account_id) from bank.loan;

-- Left Join:
select a.account_id, a.frequency, l.loan_id, l.amount, l.duration, l.payments, l.status
from bank.account as a
left join bank.loan as l on a.account_id = l.account_id
order by a.account_id
limit 5;

-- Right Join:
select a.account_id, a.frequency, l.loan_id, l.amount, l.duration, l.payments, l.status
from bank.account a
right join bank.loan l on a.account_id = l.account_id
order by a.account_id
limit 10;




