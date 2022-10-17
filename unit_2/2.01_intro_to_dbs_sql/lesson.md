# Lesson 2.1: Intro to Databases & SQL

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to make students aware of the different data sources that data analysts come across, how to write simple queries in SQL, and extract information from SQL databases. Students will also be introduced to a different case study (case study related to the _Banking_) that we will be using during this week and the following weeks for SQL.

---

### Setup

> :exclamation: Note: Please make sure that the students have the following tools set up before the start of the lecture. If there is any student that has not installed them yet, please ask the student to take help from the TA at the end of class.

- Sequel Pro - For students using Mac
- MySQL Workbench - For students using Windows and Linux

### Learning Objectives

After this lesson, students will be able to:

- Identify the different tools/technologies for storing and manipulating structured and unstructured data
- Explain the difference between database and data warehouse
- Connect to a SQL database and write simple queries in SQL to extract relevant information
- Develop business acumen for different business scenarios

---

### Lesson 1 key concepts 

> :clock10: 20 min
> [**Slides - Databases**](https://docs.google.com/presentation/d/1BIVhxnoca6v4mUf3kClUTWRPduLjID-uaVILdCzmHgU/edit?usp=sharing)

- Potential data sources available
- Tools and technologies used
- Structured vs. unstructured data

> :exclamation: Note: The instructor does not need to get in depth of the topic for eg the difference between structured and unstructured data. For the moment it would be enough to just have an overview of the differences.
---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/data_2.01_activities/blob/master/2.01_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions</summary>

- Every student would be required to explain one difference in class. Explain and correct the students wherever necessary.

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts (use ppt intro to SQL)

> :clock10: 20 min
> [**Slides - Intro to SQL**](https://docs.google.com/presentation/d/1q-P3sxtKOaSWHf2V381RRY-mC-A2JOqD1KSjq8Db4I4/edit?usp=sharing)

- Introduction to relational databases
- Introduction to SQL
- Different standards used for querying (MySQL, T-SQL, PL/SQL) - a high-level overview

---

:exclamation: Quick heads up: In the next lesson we are going to discuss the case study that we will use for SQL lessons. The instructors can use the time for the activity to review the case study. 


#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/data_2.01_activities/blob/master/2.01_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions</summary>

- Link to [activity 2 solution](https://gist.github.com/ironhack-edu/deb78ecffedff3eb90ce607844b09b68).

</details>

---

:coffee: **BREAK**

---

### Lesson 3 key concepts

> :clock10: 20 min

:exclamation: Note for instructor: Please refer to the `files_for_lesson_and_activities/case_study_bank.md` file where we have described the business scenario
- Introduction to the case study database
- Connecting to SQL database (_workbench/Sequel Pro_)
- Structure of the database, information available in different tables
- Some business questions that we are looking to answer

> The main objective to improve business by identifying customers that would be beneficial to the company. Some other ad-hoc analyses that can be performed using SQL queries have been mentioned at the end of the document.

### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/data_2.01_activities/blob/master/2.01_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions </summary>
  
- Link to [activity 3 solution](https://gist.github.com/ironhack-edu/0c8043e299ea31227632b96ba30d02c3).

</details>

---

### Lesson 4 key concepts

> :clock10: 20 min

- The basic structure of SQL queries
- Simple select queries
- Selecting columns and aliasing

:exclamation: Note to instructor: Use `files_for_lesson_and_activities/mysql_dump.sql` database. Load it to Sequel Pro, and there you will find a `bank` database which we will use for the following example.

```sql
use bank;
select * from trans;
select * from bank.trans;
```

It is a good practice to use the name of the database followed by the name of the table since, as an analyst, you might be working with multiple databases on a server.

```sql
-- to select some columns instead of all
select trans_id, account_id, date, type
from bank.trans;

-- to select some columns instead of all
select bank.trans.trans_id, bank.trans.account_id, bank.trans.date, bank.trans.type
from bank.trans;

-- aliasing columns
select trans_id as Transaction_ID, account_id as Account_ID, date as Date, type as Type_of_account
from bank.trans;

-- aliasing columns and table
select bt.trans_id as Transaction_ID, bt.account_id as Account_ID, bt.date as Date, bt.type as Type
from bank.trans as bt;

-- limiting the number of rows in the results
select bt.trans_id as Transaction_ID, bt.account_id as Account_ID, bt.date as Date, bt.type as Type
from bank.trans as bt
limit 10;

-- check the number of records in a table
select count(*) from bank.trans_id;
```

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 4 </summary>

- Link to [activity 4](https://github.com/ironhack-edu/data_2.01_activities/blob/master/2.01_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions </summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/dce29559311a9c6aafcb36e76978e89d).

</details>

---

:coffee: **BREAK**

---

### :pencil2: Practice on key concepts - Lab

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Lab </summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-intro-sql](https://github.com/ironhack-labs/lab-intro-sql)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution](https://gist.github.com/ironhack-edu/a7ae236289c245fe73b4e103546ec690).

</details>

---

### Additional Resources

- [Data warehouse schemas, Facts vs. dimensions table](http://gkmc.utah.edu/ebis_class/2003s/Oracle/DMB26/A73318/schemas.htm)
- [Data warehouses vs. Data Marts](https://www.talend.com/resources/what-is-data-mart/)
