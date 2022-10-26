-- 3.05 --
use bank;

-- EXAMPLE OF SUBQUERIES USING "WHERE":
select * from (
select account_id, bank_to, account_to, sum(amount) as Total
from bank.order
group by account_id, bank_to, account_to
) sub1
where total > 10000
limit 5;

-- Sample A: The result from this query will be used again in later session to build further in the other topic we will cover:
select bank from (
  select bank, avg(amount) as Average
  from bank.trans
  where bank <> ''
  group by bank
  having Average > 5500) sub1
limit 5;

-- Sample B : The result from this query will be used again in later session to build further in the other topic we will cover:
select k_symbol from (
  select avg(amount) as Average, k_symbol
  from bank.order
  where k_symbol <> ' '
  group by k_symbol
  having Average > 3000
  order by Average desc
) sub1;


-- 3.05 ACTIVITY 1 --
use bank;

-- 1) Find the average number of transactions by account. Get those accounts that have more transactions than the average
select count(trans_id) as trans_number
from bank.trans    -- contar transacciones de la tabla transacciones
group by account_id
order by trans_number desc;   -- estoy contando las transacciones que tiene cada cuenta

select account_id, count(trans_id) as trans_number, (
	select avg(trans_number) from (
		select count(trans_id) as trans_number
        from bank.trans
        group by account_id
        order by trans_number desc) as sub_trans_number  -- aquí había que poner el nombre de la subquery
) as sub_avg_trans_number
from bank.trans
group by account_id
having trans_number > sub_avg_trans_number
order by account_id
limit 20;

-- 2) 


