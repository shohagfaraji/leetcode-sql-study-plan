# SQL Clause Writing Order

This is the **query writing order**:

```sql
SELECT
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
WINDOW
ORDER BY
LIMIT
```

---

# SQL Logical Execution Order

This is how SQL actually executes internally:

```sql
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT
```

---

# SQL Formatting Style

## Preferred Structure

```sql
SELECT
    column_name
FROM
    table_name AS t
WHERE
    condition = 'value'
ORDER BY
    column_name;
```

---

# SQL Style Guide

## 1. Uppercase SQL Keywords

```sql
SELECT
FROM
WHERE
GROUP BY
ORDER BY
JOIN
HAVING
LIMIT
```

---

## 2. One Column Per Line

GOOD:

```sql
SELECT
    employee_id,
    employee_name,
    salary
```

BAD:

```sql
SELECT employee_id, employee_name, salary
```

---

## 3. Use Meaningful Aliases

GOOD:

```sql
Employees AS e
Departments AS d
Orders AS o
```

BAD:

```sql
Employees a
Departments b
```

---

## 4. Avoid SELECT \*

GOOD:

```sql
SELECT
    employee_id,
    employee_name
```

BAD:

```sql
SELECT *
```

---

## 5. Align Conditions

```sql
WHERE
    salary > 50000
    AND department_id = 1
    AND status = 'ACTIVE'
```

---

# Example Solution Template

## Problem: Recyclable and Low Fat Products

### Approach

- Filter products that are:
    - low fat
    - recyclable

### Solution

```sql
-- Problem: Recyclable and Low Fat Products

SELECT
    p.product_id
FROM
    Products AS p
WHERE
    p.low_fats = 'Y'
    AND p.recyclable = 'Y';
```

---

# Common SQL Patterns

## INNER JOIN

```sql
SELECT
    e.name,
    d.department_name
FROM
    Employees AS e
INNER JOIN Departments AS d
    ON e.department_id = d.department_id;
```

---

## GROUP BY

```sql
SELECT
    department_id,
    COUNT(*) AS total_employees
FROM
    Employees
GROUP BY
    department_id;
```

---

## HAVING

```sql
SELECT
    department_id,
    COUNT(*) AS total_employees
FROM
    Employees
GROUP BY
    department_id
HAVING
    COUNT(*) > 5;
```

---

## WINDOW FUNCTION

```sql
SELECT
    employee_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM
    Employees;
```

---

# Recommended SQL Learning Order

1. SELECT / WHERE
2. ORDER BY
3. GROUP BY
4. HAVING
5. JOINs
6. Subqueries
7. CTEs
8. Window Functions
9. Advanced Aggregations
10. Optimization

---

# SQL Best Practices

- Keep queries readable
- Use consistent formatting
- Prefer explicit JOINs
- Use CTEs for complex logic
- Avoid unnecessary nesting
- Write maintainable SQL
- Think about scalability

---

# Author

[Shohag Faraji](https://shohagfaraji.netlify.app/)

---

# License

MIT License
