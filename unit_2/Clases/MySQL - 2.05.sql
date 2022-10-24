-- 2.05 --

--  create database
create database if not exists bank_demo;
use bank_demo;

-- create tables (table with only primary key)

drop table if exists district_demo;

CREATE TABLE district_demo (
  `A1` int(11) UNIQUE NOT NULL,
  `A2` char(20) DEFAULT NULL,
  `A3` varchar(20) DEFAULT NULL,
  `A4` int(11) DEFAULT NULL,
  `A5` int(11) DEFAULT NULL,
  `A6` int(11) DEFAULT NULL,
  `A7` int(11) DEFAULT NULL,
  `A8` int(11) DEFAULT NULL,
  `A9` int(11) DEFAULT NULL,
  `A10` float DEFAULT NULL,
  `A11` int(11) DEFAULT NULL,
  `A12` float DEFAULT NULL,
  `A13` float DEFAULT NULL,
  `A14` int(11) DEFAULT NULL,
  `A15` int(11) DEFAULT NULL,
  `A16` int(11) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (A1)  -- constraint keyword is optional but its a good practice
);

-- create a table (table with foreign key)
drop table if exists account_demo;

CREATE TABLE account_demo (
  account_id int(11) UNIQUE NOT NULL,
  district_id int(11) DEFAULT NULL,
  frequency text,
  date int(11) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (account_id),
  CONSTRAINT FOREIGN KEY (district_id) REFERENCES district_demo(A1)
) ;

-- populating tables
insert into district_demo
values (1,'Hl.m. Praha','Prague',1204953,0,0,0,1,1,100,12541,0.29,0.43,167,85677,99107),
(2,'Benesov','central Bohemia',88884,80,26,6,2,5,46.7,8507,1.67,1.85,132,2159,2674),
 (3,'Beroun','central Bohemia',75232,55,26,4,1,5,41.7,8980,1.95,2.21,111,2824,2813),
 (4,'Kladno','central Bohemia',149893,63,29,6,2,6,67.4,9753,4.64,5.05,109,5244,5892);
 -- this gives a _referential integrity error_: second column in the `account_demo` table is the foreign key that refers to `A1` in the `district_demo` table. Since we don't have any `A1` value as 5, it can't accept that value for `district_id`.

-- Correct code:
insert into account_demo values
(1,4,'POPLATEK MESICNE',950324),
(2,1,'POPLATEK MESICNE',930226),
(3,2,'POPLATEK MESICNE',970707);

-- In the table definition of `account_demo`, the column date was defined as _integer_ type. We will modify the column to _date_ type.
alter table account_demo
modify date date;
select * from account_demo;

-- 1) Drop a column
alter table district_demo
drop column A15;
select * from district_demo;

-- 2) Rename table
alter table account_demo
rename to accountDemo;

-- 3) Rename column name in a table
alter table district_demo
rename column A1 to dist_id;

-- 4)  Add a new column
alter table accountDemo
add column balance int(11) after date;


-- 2.05 ACTIVITY 4 --
-- 1) Create the rest of the tables in the `bank` database (at least the `client` and the `card` tables). 
create table card (
  card_id int(11) default null,
  disp_id int(11) default null,
  type text,
  issued text
)

insert into card values (1005,9285,'classic','931107 00:00:00\r'),
                        (104,588,'classic','940119 00:00:00\r')

create table client (
  client_id int(11) default null,
  birth_number int(11) default null,
  district_id int(11) default null
)

insert into client values (1,706213,18),(2,450204,1),(3,406009,1),(4,561201,5),(5,605703,5)

create table disp (
  disp_id int default null,
  client_id int default null,
  account_id int default null,
  type text collate utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


create table loan (
  loan_id int default null,
  account_id int default null,
  date int default null,
  amount int default null,
  duration int default null,
  payment float default null,
  status text collate utf8mb4_unicode_ci,
  status_desc varchar(30) COLLATE utf8mb4_unicode_ci default null
)

create table order (
  order_id int default null,
  account_id int default null,
  bank_to text collate utf8mb4_unicode_ci,
  account_to int default null,
  amount float default null,
  k_symbol text collate utf8mb4_unicode_ci
)

create table trans (
  trans_id int default null,
  account_id int default null,
  date int default null,
  type text collate utf8mb4_unicode_ci,
  operation text collate utf8mb4_unicode_ci,
  amount float default null,
  balance float default null,
  k_symbol text collate utf8mb4_unicode_ci,
  bank text collate utf8mb4_unicode_ci,
  account int default null
)

-- 2) Design and create a new database structure. Justify your changes.
-- Some valid ideas for better database structure would be:

-- - Add FK Account -> Client
alter table bank.account
add column client_id int null;

alter table bank.account
add constraint fk_account_1
  foreign key (client_id)
  references bank.client (client_id)
  on delete no action
  on update no action;

-- - Add FK Card -> Account
alter table bank.card
add column client_id int null;

alter table bank.card
add constraint fk_card_1
  foreign key (client_id)
  references bank.client (client_id)
  on delete no action
  on update no action;

-- - Rename district columns
alter table district change A1 to district_id;
alter table district change A2 to district_name;
alter table district change A3 to region;
alter table district change A3 to population;
alter table district change A5 to num_muni_very_small;
alter table district change A6 to num_muni_small;
alter table district change A7 to num_muni_medium;
alter table district change A8 to num_muni_large;
alter table district change A9 to num_cities;
alter table district change A10 to urban_ratio;
alter table district change A11 to avg_salary;
alter table district change A12 to unmployment_rate_95;
alter table district change A13 to unmployment_rate_96;
alter table district change A14 to entrepreneurs;
alter table district change A15 to crimes_95;
alter table district change A16 to crimes_96;