# Lesson 2.2: Operators & Functions in SQL

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to learn how to use different operators and functions available in SQL to filter data and extract relevant information from the database.

---

### Setup

To start this lesson, students should have:

- Completed lesson 2.1
- All previous Setup

### Learning Objectives

After this lesson, students will be able to:

- Interpret arithmetic, comparison, and logical operators
- Use different pre-built functions (numeric and string) for data processing
- Use different operators and functions together to extract relevant information from the database

---

### Lesson 1 key concepts

> :clock10: 20 min

> [**Slides**](https://docs.google.com/presentation/d/1EqeLKQDowPYbtfyG9PnlLtcqKi_1TbukUZDimAKm7qo/edit?usp=sharing)

- Simple Queries with the `WHERE` clause
- _OLTP_ vs. _OLAP_
- Database vs. Data Warehouse vs. Data Mart vs. Data Lakes

<details>
  <summary> Click for Code Sample </summary>

:exclamation: Note for instructor: Keep working on `bank` database.

```sql
select * from bank.order
where amount > 1000;

select * from bank.order
where k_symbol = 'SIPO';

select order_id, account_id, bank_to, amount from bank.order
where k_symbol = 'SIPO';

select order_id as 'OrderID', account_id as 'AccountID', bank_to as 'DestinationBank', amount  as 'Amount'
from bank.order
where k_symbol = 'SIPO';

-- limiting results in the above query
select order_id as 'OrderID', account_id as 'AccountID', bank_to as 'DestinationBank', amount  as 'Amount'
from bank.order
where k_symbol = 'SIPO'
limit 100;
```

</details>

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/data_2.02_activities/blob/main/2.02_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions</summary>

- Link to [activity 1 solution](https://gist.github.com/ironhack-edu/81dbc84888749e4d62ddccae755a904f).

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts

> :clock10: 20 min

- Arithmetic operators in SQL (add (`+`), subtract (`-`), multiply (`*`), divide (`/`), modulo (`%`))
- Comparison operators in SQL (equal to (`=`), greater than (`>`), less than (`<`), greater than equal to (`>=`), less than equal to (`<=`), not equal to (`<>`))
- Limiting results in SQL (similar to `head()` in data frames)

<details>
  <summary>Click for code: Arithmetic Operators</summary>

```sql
select *, amount-payments as balance
from bank.loan;

select loan_id, account_id, date, duration, status, amount-payments as balance
from bank.loan;

select loan_id, account_id, date, duration, status, (amount-payments)/1000 as 'balance in Thousands'
from bank.loan;

-- this is the modulus operator that gives the remainder. This is a dummy example:
select duration%2
from bank.loan;

select 10%3;
```

</details>

<details>
  <summary>Click for code: Comparison Operators</summary>

> These comparison operators are used with the `WHERE` clause, for filtering data:

```sql
select * from bank.loan
where status = 'B';
-- In this case status B is for those clients where the contract has finished but the loan is not paid yet

select * from bank.loan
where status in ('B','b');

select * from bank.loan
where status in ('B','b') and amount > 100000;
```

</details>

<details>
  <summary>Click for code: Limiting Results</summary>

```sql
select * from bank.loan
limit 10;

-- to get the bottom rows of a table, there is no predefined function
-- but you can sort the results in descending order and then use the LIMIT function
select * from bank.account
order by account_id desc
limit 10;
-- In this case, we were able to do it because the data was arranged
-- in ascending order of the account_id
```

</details>

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/data_2.02_activities/blob/main/2.02_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions </summary>

- Link to [activity 2 solution](https://gist.github.com/ironhack-edu/431610847110b949bc316f6f40c4faeb).

</details>

---

:coffee: **BREAK**

---

### Lesson 3 key concepts

> :clock10: 20 min

- Using multiple conditions with the `WHERE` clause
- Using logical operators

<details>
  <summary>Click for code: Logical Operators</summary>

```sql
-- two conditions applied on the table
select *
from bank.loan
where status = 'B' and amount > 100000;

-- we can have as many conditions as we need
select *
from bank.loan
where status = 'B' and amount > 100000 and duration <= 24;

--
select *
from bank.loan
where status = 'B' or status = 'D';
-- Status B and D are the clients that were bad for business for the bank

select *
from bank.loan
where (status = 'B' or status ='D') and amount > 200000;

-- logical NOT operator - it negates the boolean expression that we are evaluating
select *
from bank.order
where not k_symbol = 'SIPO';

select *
from bank.order
where not k_symbol = 'SIPO' and not amount < 1000;
```

</details>

### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 20 min

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/data_2.02_activities/blob/main/2.02_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions </summary>

- Link to [activity 3 solution](https://gist.github.com/ironhack-edu/f2447753a66a8a2ccbbbb4b39cf74a5e).

</details>

---

### Lesson 4 key concepts

> :clock10: 20 min

- Using numeric functions
- Using string functions

<details>
  <summary> Click for Code: Numeric Functions </summary>

```sql
select order_id, round(amount/1000,2)
from bank.order;

-- checking the number of rows in the table, both methods give the same result
-- given that there are no nulls in the column in the second case:
select count(*) from bank.order;

select count(order_id) from bank.order;

select max(amount) from bank.order;
select min(amount) from bank.order;

select floor(avg(amount)) from bank.order;
select ceiling(avg(amount)) from bank.order;
```

> There are other numeric functions including `acos()`, `asin()`, `atan()`, `log()`, `log10()`, `power()`, and `sqrt()`.

</details>

<details>
  <summary> Click for Code: String Functions</summary>

```sql
select length('himanshu');
select *, length(k_symbol) as 'Symbol_length' from bank.order;
select *, concat(order_id, account_id) as 'concat' from bank.order;

-- formats the number to a form with commas,
-- 2 is the number of decimal places, converts numeric to string as well
select *, format(amount, 2) from bank.loan;

select *, lower(A2), upper(A3) from bank.district;
-- It is interesting to note that select lower(A2), upper(A3), * from bank.district; doesn't work

select A2, left(A2,5), A3, ltrim(A3) from bank.district;
-- Similar to ltrim() there is rtrim() and trim(). And similar to left() there is right()
```

- More string functions can be found [here](https://www.w3resource.com/slides/mysql-string-functions.php) or [here](https://www.w3schools.com/sql/sql_ref_sqlserver.asp).

</details>

<details>
  <summary> Click for Code: String Functions</summary>

```sql
-- Splitting strings using substring_index

select substring_index(issued, ' ', 1) from bank.card;
```

:exclamation: Note for instructor: The idea behind the last query is to select the date part from the column 'issued' in the `card` table. Even though it looks like data is in DateTime format, but it is actually a string. We will use this later to convert the extracted _date_ which will be in the _string_ format to the _date_ format.

</details>

### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min

<details>
  <summary> Click for Instructions: Activity 4 </summary>

- Link to [activity 4](https://github.com/ironhack-edu/data_2.02_activities/blob/main/2.02_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions </summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/5418f2086927f81425454555be3e4ba0).

</details>

### :pencil2: Practice on key concepts - Lab

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Lab </summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-sql-2](https://github.com/ironhack-labs/lab-sql-2)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution](https://gist.github.com/ironhack-edu/9598cbe31d75dea13b50c30bb83af6e4).

</details>

---

### Additional Resources

- [Data Warehouse schemas, Facts vs. dimensions table](http://gkmc.utah.edu/ebis_class/2003s/Oracle/DMB26/A73318/schemas.htm)
- [Data Warehouses vs. Data Marts](https://www.talend.com/resources/what-is-data-mart/)
