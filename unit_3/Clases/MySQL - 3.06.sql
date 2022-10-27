-- 3.06 --
use bank;

-- 3.06.1. Common Table Expressions (CTEs) --
with cte_loan as (
	select * from bank.loan
)
select * from cte_loan
where status = 'B'
limit 5;
-- Encontrar total amount y total balance de cada consumidor en tabla "transactions"
-- Luego más info con join de CTE y tabla "account"

with cte_transactions as (
  select account_id, sum(amount), sum(balance)
  from bank.trans
  group by account_id
)
select * from cte_transactions ct
join account a
on ct.account_id = a.account_id
limit 5;

-- 3.06 ACTIVITY 1 --
-- Use a CTE to display the first account opened by a district:
with ordered_bank_accounts as (
  select account_id, district_id, rank() over (partition by district_id order by date) as open_order
  from bank.account
)
select d.A3, d.A2, a.account_id
from ordered_bank_accounts a
inner join bank.district d on d.A1 = a.district_id
where open_order = 1
order by d.A3, d.A2
limit 5;


-- 3.06.2 VIEWS --
-- Las Views son como tablas en la base de datos que se pueden usar para hacer queries como una tabla normal pero no almacenan info permanente
-- Es decir, una tabla ocupa espacio; Una View no
drop view if exists running_contract_ok_balances;

create view running_contract_ok_balances as
with cte_running_contract_OK_balances  as (
  select *, amount-payments as Balance
  from bank.loan
  where status = 'C'
  order by Balance
)
select * from cte_running_contract_OK_balances
where Balance > (
  select avg(Balance)
  from cte_running_contract_OK_balances
)
order by Balance desc
limit 20;

select * from running_contract_ok_balances
limit 3;

-- 3.06 ACTIVITY 2 --
-- Para detectar posibles fraudes, queremos crear una view "last_week_withdrawals" con las retiradas totales por cliente la semana pasada:
drop view if exists last_week_withdrawals;

create view last_week_withdrawals as
with transactions as (
  select *, (select max(date) from bank.trans) as max_date 
  from bank.trans
)

select client_id, round(sum(amount)) total_withdrawal
from bank.disp
left join transactions
using (account_id)
where date(date) > date_sub(max_date, interval 7 day)
group by client_id;

select * from last_week_withdrawals
limit 5;


-- 3.03 VIEWS - CHECK --
-- Use "WITH CHECK OPTION" clause: previene a una view de actualizar o insertar filas que no son visibles
-- Drop an existing view
drop view if exists customer_status_D;

create view customer_status_D as
select * from bank.loan
where status = 'D'
with check option;

-- Otra opción:
create or replace view customer_status_D as
select * from bank.loan
where status = 'D'
with check option;

-- Si intentamos ahora 

-- 3.06 ACTIVITY 3 --

