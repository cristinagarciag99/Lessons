# Null values and the three-valued logic

## Null values

The **relational** model defines two marks representing missing values: an `A-Mark` (missing and applicable) and an `I-Mark` (missing and inapplicable). The former represents a case where a value is generally applicable, but for some reason is missing. For example, consider the attribute `birthdate` of the _People_ relation. For most people this information is known, but in some rare cases it is NA, as my wife’s grandpa will attest. Obviously, he was born on some date, but no one knows which date it was. The latter represents a case where a value is irrelevant.

A common mistake that people make is to use the term `NULL` value but a `NULL` is not a value; rather, it’s a mark for a missing value. So the correct terminology is either `NULL mark` or just `NULL`. Also, because SQL uses only one mark for missing values, when you use a `NULL`, there is no way for SQL to know whether it is supposed to represent a missing and applicable case or a missing and inapplicable case.

## Three-valued logic

The possible values of a predicate in SQL are `TRUE`, `FALSE` and `UNKNOWN`. This is referred to as *three-valued logic* and is unique to SQL. Logical expressions in most programming languages can be only `TRUE` or `FALSE`. The `UNKNOWN` logical value in SQL typically occurs in a logical expression that involves `a NULL`. For example, the logical value of each of these three expressions is `UNKNOWN`:

```
NULL > 1759;
NULL = NULL;
X + NULL > Y
```

Remember that the `NULL mark` represents a missing value. According to SQL, when comparing a missing value to another value (even another `NULL`), the logical result is always `UNKNOWN`.
The `UNKNOWN` logical results and NULLs are treated inconsistently in different elements of the language. For example, all query filters (`ON`, `WHERE`, and `HAVING`) treat `UNKNOWN` like `FALSE`. A row for which a filter is `UNKNOWN` is eliminated from the result set. In other words, query filters return `TRUE` cases. On the other hand, an `UNKNOWN` value in a `CHECK` constraint is actually treated like TRUE. Suppose you have a `CHECK` constraint in a table to require that the salary column be greater than zero. A row entered into the table with a `NULL` salary is accepted because (`NULL > 0`) is `UNKNOWN` and treated like `TRUE` in the `CHECK` constraint. In other words, _`CHECK` constraints reject `FALSE` cases_.
