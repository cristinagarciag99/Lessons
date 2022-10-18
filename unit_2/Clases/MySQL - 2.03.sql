-- 2.03 --
select account_id, district_id, frequency, CONVERT(date,datetime)
from bank.account;

-- converting the original format to the date format we need:
select date_format(convert(date,date), '%Y---%M---%D') as formatted_date
from bank.loan;

select date_format(convert(date,date), '%Y') 
from bank.loan;


-- 2.03 ACTIVITY 1 --
select card_id, date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%Y') as year_issued
from bank.card
where type = 'gold'
limit 10;

select min(date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%Y')) as year_issued
from bank.card
where type = 'gold';

select date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%M %D, %Y') as year_issued,
       date_format(convert(SUBSTRING_INDEX(issued, ' ', 1), date), '%d of %M of %Y') as fecha_emision
from bank.card
limit 10;

select * from bank.card
where type = 'classic'
order by card_id
limit 10;

select * from bank.order
where k_symbol = 'SIPO' and amount > 5000
order by order_id desc
limit 10;

select isnull('Hello');

select isnull(card_id) from bank.card;

select * from bank.order
where k_symbol is null;
-- sale tabla vacia pq no hay elemento null, si hubiera saldria --

select * from bank.order
where k_symbol is not null and k_symbol = ' ';


-- 2.03 ACTIVITY 3 --
select * from bank.trans
where amount is null;

select sum(k_symbol = ' ') as k_symbol_empty, 
   sum(not k_symbol = ' ') as k_symbol_non_empty
from bank.trans
where amount is not null;

select loan_id, account_id,
case
when status = 'A' then 'Good - Contract Finished'
when status = 'B' then 'Defaulter - Contract Finished'
when status = 'C' then 'Good - Contract Running'
else 'In Debt - Contract Running'
end as 'Status_Description'
from bank.loan;
