-- 2.04 --
use bank;

select A3 from bank.district;
select distinct A3 from bank.district;

select * from bank.order
where k_symbol in ('leasing', 'pojistine');

select * from bank.account
where district_id in (1,2,3,4,5);

-- We are trying to get the same result using the between operator.
-- Note that 1 and 5 are included in the range of values compared/evaluated
select * from bank.account
where district_id between 1 and 5;

select * from bank.loan
where amount - payments between 1000 and 10000;

-- 2.04 ACTIVITY 1 --
-- 1) Get different card types
select distinct type from bank.card;

-- 2) Get transactions in the first 15 days of 1993
select * from bank.trans
where convert(date,date) between '1993-01-01' and '1993-01-15'
limit 10;

-- 3) Get all running loans
select count(*) from bank.loan
where status in ('C', 'D');

-- 4) Find the different values from the field A2 that start with the letter "K"
select distinct A2 from bank.district
where A2 regexp '^k';

-- 5) Find the different values from the field A2 that end with the letter "K"
select distinct A2 from bank.district
where A2 regexp 'k$';


-- 2.04 ACTIVITY 2 --
-- 1)
select * from bank.district
where A3 like 'north%M%';

select * from bank.district
where A3 like 'north_M%';

-- 2)
select * from bank.district
where A2 regexp 'ch[e-r]';


-- 3)
select * from bank.trans
order by type;

-- 4)
select * from bank.trans
order by k_symbol;

-- 5)
select trans_id, type from bank.trans
order by balance;

select trans_id, type, balance from bank.trans
order by balance;


-- More on Regexp --
select * from bank.district
where A2 regexp 'cesk[ey]';

select * from bank.district
where A2 regexp 'ch[e-r]';
