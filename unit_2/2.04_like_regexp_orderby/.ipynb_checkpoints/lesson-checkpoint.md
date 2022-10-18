# Lesson 2.4: Data Cleaning, Operators & Main clauses - SQL

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to proceed with learning basic SQL queries, combined with other operators including `BETWEEN`, `LIKE`, `REGEXP`(regular expressions), and `DISTINCT` keyword. We will also take a look at more examples focusing on the five main clauses of the `SELECT` statement, which includes `select`, `from`, `where`, `order by`, and `limit`, along with the applications of some operators and expressions we have looked at so far.

> Note: An expression is a combination of columns and operators that evaluate to a single value. In the select clause, you can code an expression with one or more operators and functions.

---

### Setup

To start this lesson, students should have:

- Completed lesson 2.3
- All previous Setup

---

### Learning Objectives

After this lesson, students will be able to:

- Remove duplicates using the `DISTINCT` keyword
- Use operators including `BETWEEN`, `LIKE`, and `REGEXP`
- Work with 5 main clauses - `SELECT`, `FROM`, `WHERE`, `ORDER BY`, and `LIMIT`

---

### Lesson 1 key concepts

> :clock10: 20 min

- Removing duplicate rows with `DISTINCT`
- Using `IN` operator
- Using `BETWEEN`

<details>
<summary> Click for Code Sample </summary>

:exclamation: Note for instructor: Keep working on the `bank` database.

```sql
select A3 from bank.district;
select distinct A3 from bank.district;
```

```sql
select * from bank.order
where k_symbol in ('leasing', 'pojistine');
```

:exclamation: Note for instructor: Remind the students that when using comparison operators in MySQL, they are not case sensitive, which means 'LEASING' and 'leasing' will be evaluated as equal.

```sql
select * from bank.account
where district_id in (1,2,3,4,5);
```

```sql
-- We are trying to get the same result using the between operator.
-- Note that 1 and 5 are included in the range of values compared/evaluated

select * from bank.account
where district_id between 1 and 5;

select * from bank.loan
where amount - payments between 1000 and 10000;
```

</details>

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/dataV3_2.06_activities/blob/master/lesson_2.06_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions </summary>

- Link to [activity 1 solution](https://gist.github.com/ironhack-edu/59a3b96d8bcec136d70ceece723f85a3).

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts

> :clock10: 20 min

- Using `LIKE` operator
- Using `REGEXP`

> The `LIKE` and `REGEX` can be used to extract rows that match a string pattern, called a _mask_. Mask for `LIKE` can contain special characters called wildcards. `%`, and `_` are two wildcards that can be used with `LIKE`.

<details>
<summary> Click for Code Sample </summary>

```sql
select * from bank.district
where A3 like 'north%';

select * from bank.district
where a3 like 'north_M%';
-- This would return all the results for
-- 'north  Moravia', 'northMoravia', northMiami'
```

How is the result changed if we use `%` instead of `_` in the previous query? This is an activity for students later after this session.

```sql
select * from bank.district
where a3 regexp 'north';

-- Now we will take a look at another table
-- to see the difference between LIKE and REGEXP
select * from bank.order
where k_symbol regexp 's';

select * from bank.order
where k_symbol regexp '^s';

select * from bank.order
where k_symbol regexp 'o$';

-- We can include multiple conditions at the same time
select distinct k_symbol from bank.order
where k_symbol regexp 'ip|is';
```

</details>

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/dataV3_2.06_activities/blob/master/lesson_2.06_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions</summary>

- Link to [activity 2 solution](https://gist.github.com/ironhack-edu/60dcdf900187836b316680301ece2ebd).

</details>

---

:coffee: **BREAK**

---

### Lesson 3 key concepts

> :clock10: 20 min

- More on Regexp

<details>
<summary> Click for Code Sample </summary>

```sql
select * from bank.district
where a2 regexp 'cesk[ey]';

select * from bank.district
where a2 regexp 'ch[e-r]';
```

Here are some more examples on regular expressions:

![regular expressions](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/regular_expression_examples.png)

> Note: `LIKE` and `REGEXP` operators significantly degrade the performance of query execution as compared to simple comparison operators. One should be careful when using them.

</details>

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/dataV3_2.06_activities/blob/master/lesson_2.06_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions</summary>

1. Discussion

2. Link to [activity 3 solution](https://gist.github.com/ironhack-edu/d805a6ee40c38ae949695ee426aef410).

</details>

---

:coffee: **BREAK**

---

### Lesson 4 key concepts

> :clock10: 20 min

Arrange results in ascending or descending order

- Using `order by` clause with one column
- Using `order by` clause with more than one column

<details>
<summary> Click for Code Sample </summary>

```sql
select distinct a2 from bank.district
order by a2;

select distinct a2 from bank.district
order by a2 asc;

select * from bank.district
order by a3;

select * from bank.district
order by a3 desc;
```

> Some important points to remember: (NOTE: the students will test the last three points by themselves in the activity)

    - Note that, by default, (if not specified) the order is ascending.
    - By default, in an ascending sort, special characters appear first, followed by numbers, and then letters.
    - Null values appear first if the order is ascending.
    - You can use any column from the table to sort the values even if that column is not used in the select statement.

```sql
select * from bank.order
order by account_id, bank_to;

select * from bank.order
order by account_id, bank_to, k_symbol;
```

</details>

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 4 </summary>

- Link to [activity 4](https://github.com/ironhack-edu/dataV3_2.06_activities/blob/master/lesson_2.06_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions</summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/8be25f00870e28c0daf6e6a795ae3b39).

</details>

---

:coffee: **BREAK**

---

### :pencil2: Practice on key concepts - Lab

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Lab </summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-sql-4](https://github.com/ironhack-labs/lab-sql-4)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution](https://gist.github.com/ironhack-edu/6e9f08817f6d9b69c4ea8960d988e71f).

</details>

<details>
  <summary> Click for Instructions: Lab 2 </summary>

:exclamation: Note for instructor: If your students or some of them need some additional practice on the SQL basics, this lab could be used.

- Link to the lab: [https://github.com/ironhack-labs/lab-sql-basics](https://github.com/ironhack-labs/lab-sql-basics)

</details>

---
