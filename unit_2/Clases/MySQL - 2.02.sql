-- 2.02 --
select *, amount-payments as balance
from bank.loan;

select loan_id, account_id, date, duration, status, (amount-payments)/1000 as 'balance in Thousands'
from bank.loan;

-- operacion modulo: resto de la division
select duration%2
from bank.loan;

select 10%3;

-- comparacion de operadores logicos
select * from bank.loan
where status in ('B', 'b');

-- condiciones multiples
select * from bank.loan
where status in ('B', 'b') and amount > 100000;

-- Limitar a 10 resultados
select * from bank.loan
limit 10;

-- coger los 10 ultimos elementos (tail) de la tabla
select * from bank.account
order by account_id desc
limit 10;


-- 2.02 ACTIVITY 2 --
select *
from bank.loan
where status = 'B';

select * 
from bank.loan
where status = 'B' and amount > 100000 and duration <= 24;

select *
from bank.loan
where status in ('B', 'D');

select *
from bank.loan
where (status = 'B' or status = 'D') and amount > 200000;

-- "and" es una querie que tiene preferencia al "or"
select *
from bank.loan
where status = 'B' or status = 'D' and amount > 200000;

-- los paréntesis tienen preferencia
select *
from bank.loan
where (status = 'B' or status = 'D') and amount > 200000;

-- operador "not" (negación: negamos la condición)
select *
from bank.order
where not k_symbol = 'SIPO';

select *
from bank.order
where not k_symbol = 'SIPO' and not amount < 1000;


-- 2.02 ACTIVITY 3 --
select junior from bank.card.type;


-- NUMERIC FUNCTIONS
-- checking number rows in a table ( 2 methods)
select count(*) from bank.order;
select count(order_id) from bank.order;

select max(amount) from bank.order;
select min(amount) from bank.order;

select floor(avg(amount)) from bank.order;
select ceiling(avg(amount)) from bank.order;

-- STRING FUNCTIONS
select length('himanshu');

select *, concat(order_id, account_id) as 'concat' from bank.order;

-- formats the number to a form with commas (2 is nº decimal places)
select *, fromat(amount, 2) from bank.loan;

-- interesting: doesn´t work
select *, lower(A2), upper(A3) from bank.district;

select A2, left (A2, 5), A3, ltrim(A3) from bank.district;


-- 2.02 ACTIVITY 4 --