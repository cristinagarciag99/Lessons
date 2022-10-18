# Lesson 2.5: Entity-Relationship Diagram (ERD) & Keys

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to familiarize students with some of the database design principles including _entities_, _attributes_, _relationships_, as well as with the _entity relationship diagrams_. The students will also learn about different kinds of SQL commands (_DDL_, _DML_, _DCL_, and _TCL_). We will then use some simple _DDL_ commands to:

    - create a table,
    - alter the properties of a table, and
    - populate the table with new data.

### Setup

To start this lesson, students should have:

- Completed lesson 2.4
- All previous Setup

---

### Learning Objectives

After this lesson, students will be able to:

- Interpret entity-relationship diagram
- Interpret primary keys and foreign keys, and introduce normalization
- Distinguish between different SQL commands as DML, DDL, DCL, and TCL
- Use DDL to create a database and alter tables in an existing database

---

### Lesson 1 key concepts

> :clock10: 20 min
> **Learning Activity:** [Slideshow](../slides/2.5.1-Keys.pptx)

Entities and their attributes

- `Primary key` and its properties
- `Foreign keys` and why we need them

> Use the ER model to explain the concept of entities and attributes. Also, refer to the `files_for_lesson_and_activities/case_study.pdf` to show the entities and attributes of this database.

- _Primary_ key and its properties

  Introduce the idea of the primary key and foreign key. _Primary keys_ are used to uniquely identify every row/record in a table. It is _unique and not null._

- _Foreign_ keys and why we need them

  Foreign keys are used to create a link between two tables so that we do not repeat the same information in multiple tables. This is crucial for a very important database design principle called "normalization". This helps in eliminating data redundancy in the database.

![Normalized Data](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/2.5-normalized_data_example.png)

![Non-normalized Data](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/2.5-non_normalized_data_example.png)

If you compare the two images, you can see the amount of redundant information. If you imagine this in a database that has a large number of such tables and thousands of rows, it can lead to extremely inefficient storage of information. **Hence, the foreign keys are used to reference data from another table, to establish that link wherever necessary.**

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/data_2.05_activities/blob/master/2.05_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions</summary>

- Link to [activity 1 solution](https://gist.github.com/ironhack-edu/f596fe11eafb506c85a3d1ca339aae66).

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts

> :clock10: 20 min

- Establishing the relationship between entities
- Understanding Entity-Relationship diagrams
- Identify primary keys and foreign keys in the diagram

![ER Diagram for the case study](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/2.5-caseStudy_ER_diagram.png)

- Note there is another important concept of cardinality in relationships and types of relationships including one to one, one to many, and many to many. We will talk about those concepts in detail later.

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/data_2.05_activities/blob/master/2.05_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions</summary>

- No separate gist added here. The question is to identify the primary and foreign keys in the tables from the database entity relationship diagram.

</details>

---

---

:coffee: **BREAK**

---

### Lesson 3 key concepts

> **Learning Activity:**[Slideshow](https://docs.google.com/presentation/d/1C5_hClIbR1nyyX4DNzsvTgstdjzIbrvV/edit?usp=drive_web&ouid=108438125133210712048&dls=true)

> Note that this is just an introduction to make the students familiar with the terms/concepts including data integrity constraints, DML etc. In the next session, we will talk more in detail on how to use _DDL_ commands. Also, inform the students that we will focus on _DML_ more in this curriculum, since writing these commands, and especially `select` queries, is crucial for any data analyst/business analyst.

> :clock10: 20 min

Data Integrity constraints

- What are these constraints and why are they important
- Entity Integrity Constraint
- Referential Integrity Constraint
- Domain Integrity Constraint

- _Data integrity constraints_ are the set of rules that ensure the accuracy and consistency of data over its entire life cycle. They are a critical aspect to the design, implementation, and usage of any system which stores, processes, or retrieves data.
- _Entity integrity constraints_ are a set of rules that states that every table must have a primary key that uniquely identifies each record/row of the data. It should be unique and not null.
- _Referential integrity constraints_ require that a foreign key must take either one of the values that its primary key has or the NULL value i.e. the foreign key can't take a value that is not defined already as a primary key in the table where it is referenced from.
- _Domain integrity constraints_ require that all the values of an attribute must be from the same domain i.e. in a column, all values must be of the same data type.

- Kinds of SQL commands:

      - _DML_: Data Manipulation Language
      - _DDL_: Data Definition Language
      - _DCL_: Data Control Language
      - _TCL_: Transaction Control Language

- Data Manipulation Language is used to edit the data present in the database. Select, insert, update, delete.
- Data Definition Language is to either create or modify the table or the database structure. Create, alter, drop, truncate, rename.
- Data Control Language is used to give rights and permission to the user. It is used to control access to the database by securing it. Grant, revoke.
- Transactional Control Language is used to create and manage transactions within the database. Commit, rollback, savepoint.

Note that this is just an introduction to make the students familiar with these terms/concepts. In the next session, we will talk more in detail on how to use _DDL_ commands. Also, inform the students that we will focus on _DML_ more in this curriculum, since writing these commands, and especially `select` queries, is crucial for any data analyst/business analyst.

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/data_2.05_activities/blob/master/2.05_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions</summary>

- Link to [activity 3 solution](https://gist.github.com/ironhack-edu/898f7213370264ee6c7808ae2a85e266).

</details>

---

:coffee: **BREAK**

---

### Lesson 4 key concepts

> :clock10: 20 min

- Let's say that we are trying to re-create the bank database. We already know the tables we need to define. We have all the information that we need, which includes their attributes, primary keys and foreign keys, ER diagram, and so on. Now we will try to use DDL commands to create some of the tables of the database ourselves.

- Emphasize on how we are adding the data integrity constraints (entity and referential integrity constraints) while creating the tables. That will dictate how we can access the data from the tables when we write queries on this database.
- We will show the students how to create tables account and district and insert values in them. The students will create the rest of the tables themselves in the activity session.

Using DDL (`Data Definition Language`)

- Create database 'bank_demo'
- Create tables
- Populating data into tables
- Altering properties of a table - Used to add, delete/drop or modify columns in the existing table

<details>
<summary> Click for Code Sample </summary>

```sql
--  create database
create database if not exists bank_demo;
use bank_demo;
```

```sql
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
```

```sql
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
```

```sql
-- populating tables
insert into district_demo
values (1,'Hl.m. Praha','Prague',1204953,0,0,0,1,1,100,12541,0.29,0.43,167,85677,99107),
(2,'Benesov','central Bohemia',88884,80,26,6,2,5,46.7,8507,1.67,1.85,132,2159,2674),
 (3,'Beroun','central Bohemia',75232,55,26,4,1,5,41.7,8980,1.95,2.21,111,2824,2813),
 (4,'Kladno','central Bohemia',149893,63,29,6,2,6,67.4,9753,4.64,5.05,109,5244,5892);
```

Note the below code will give a _referential integrity error_. Ask the students why this error is there.

- Reason: Second column in the `account_demo` table is the foreign key that refers to `A1` in the `district_demo` table. Since we don't have any `A1` value as 5, it can't accept that value for `district_id`.

```sql
insert into account_demo values
(1,4,'POPLATEK MESICNE',950324),
(2,1,'POPLATEK MESICNE',930226),
(3,5,'POPLATEK MESICNE',970707);
```

- Correct Code

```sql
insert into account_demo values
(1,4,'POPLATEK MESICNE',950324),
(2,1,'POPLATEK MESICNE',930226),
(3,2,'POPLATEK MESICNE',970707);
```

- In the table definition of `account_demo`, the column date was defined as _integer_ type. We will modify the column to _date_ type.

```sql
alter table account_demo
modify date date;
select * from account_demo;
```

> Drop a column

```sql
alter table district_demo
drop column A15;
select * from district_demo;
```

> Rename table name

```sql
alter table account_demo
rename to accountDemo;
```

> Rename column name in a table

```sql
alter table district_demo
rename column A1 to dist_id;
```

> Add a new column

```sql
alter table accountDemo
add column balance int(11) after date;
```

</details>

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 4 </summary>

- Link to [activity 4](https://github.com/ironhack-edu/data_2.05_activities/blob/master/2.05_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions </summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/d17c76d48a06b7e7c2e458ee574baae3).

</details>

---

:coffee: **BREAK**

---

### :pencil2: Practice on key concepts - Lab

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Lab </summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-sql-5](https://github.com/ironhack-labs/lab-sql-5)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution](https://gist.github.com/ironhack-edu/eb72d39ab571b69a1e7ccdc9bc23cb42).

</details>

---
