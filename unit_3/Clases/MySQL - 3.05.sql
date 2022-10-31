-- 3.05 --
use bank;

-- 3.05.1 SQL-PYTHON --
-- SQL Cell Magic:
select *
from loan
limit 10;

-- SQL Line Magic:
select * from loan limit 10;

-- (más completo en jupyter, aquí hay codes que no van)  


-- 3.05.2. SUBQUERIES --
-- Example of subquery using "WHERE":
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
-- esto no es lo que queremos tal cual, es la segunda subquery, la dejo aquí para entenderla --

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


-- Subqueries using "IN" operator: comparison with a list of values:
-- (Using results from Sample A)
select * from bank.order
where bank_to in (
	select bank from (
		select bank, avg(amount) as Average
        from bank.trans
        where bank <> ''
        group by bank having Average > 5500
        ) sub1
)
and k_symbol <> ' '
limit 5;

-- (Using results from Sample B: k_symbols based on avg amount of table "order")
select * from bank.trans
where k_symbol in (
	select k_symbol as symbol from (
		select avg(amount) as Average, k_symbol
        from bank.order
        where k_symbol <> ' '
        group by k_symbol
        having Average > 3000
        order by Average desc
	) sub1
)
limit 5;


-- 3.05 ACTIVITY 2
-- 1) Get a list of accounts from Central Bohemia using a subquery
select * from bank.account
where district_id in (
	select A1 from bank.district
    where A3 = 'central Bohemia'
)
limit 5;

-- 2) Rewrite the previous as a join query
select a.* from bank.account a 
inner join bank.district d on d.A1 = a.district_id
where d.A3 = 'central Bohemia';


-- 3) Discuss which method will be more efficient



-- 3.05 ACTIVITY 3 --
-- Find the most active customer or each district in Central Bohemia:
select account_id, district_id, sum(amount) as total, rank() over (
  partition by district_id
  order by sum(amount) desc
) position
from bank.account
inner join bank.trans
using (account_id)
where district_id in (
  select district_id
  from bank.district
  where A3 = 'central Bohemia'
)
group by account_id
order by district_id desc
limit 5;

select * from (
  select account_id, district_id, sum(amount) as total, rank() over (
    partition by district_id
    order by sum(amount) desc
  ) position
  from bank.account
  inner join bank.trans
  using (account_id)
  where district_id in (
    select district_id
    from bank.district
    where A3 = 'central Bohemia'
  )
group by account_id
order by district_id desc
) t
where position = 1
limit 5;

select * from (
  select account_id, district_id, sum(amount) as total, rank() over (
    partition by district_id
    order by sum(amount) desc
  ) position
  from bank.account
  inner join bank.trans
  using (account_id)
  where district_id in (
    select district_id
    from bank.district
    where A3 = 'central Bohemia'
  )
group by account_id
order by district_id desc
) t
where position = 1
limit 10;