-- 2.01 --
use bank;

select * from trans;
select * from bank.trans;

-- to select some columns instead of all
select trans_id, account_id, date, type
from bank.trans;

-- to select some columns instead of all
select bank.trans.trans_id, bank.trans.account_id,
bank.trans.date, bank.trans.type
from bank.trans;

-- aliasing columns
select trans_id as Transaction_ID, account_id as Account_ID, 
date as Date, type as Type_of_account
from bank.trans as bt;

-- limiting the number of rows in the results
select bt.trans_id as Transaction_ID, bt.account_id as Account_ID,
bt.date as Date, bt.type as Type
from bank.trans as bt
limit 10;

-- Check the number of records in a table
select count(*) from bank.trans;


-- 2.01 ACTIVITY 4 --
select "Hello World";

select 1+2;

-- funcion distinct para ver el subset (todos los registros distintos)
select distinct type from bank.card;

select A2 as district_name from bank.district;

-- seleccionar solo A2 y A3, ordenando desde A2 en ascendente
select distinct A2 as district_name, A3 as region_name
from bank.district 
order by A2 asc
limit 30;




