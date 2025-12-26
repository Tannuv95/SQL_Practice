-- Day 2: FAANG SQL Interview Question
-- Topic: Subquery, MAX()
-- Source: Interview-style / DataLemur-like

/* ---------------------------------------------------
Question:
As an HR analyst, determine the second-highest salary
among all employees.

Requirements:
- Multiple employees may share the same salary
- If duplicates exist, display the salary only once
- Return only the second-highest salary
--------------------------------------------------- */


/* ========== Solution: Using Subquery ========== */

SELECT 
    MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (
    SELECT MAX(salary)
    FROM employee
);


/*
Explanation:
1. The inner subquery finds the highest salary in the table.
2. The outer query filters salaries less than the maximum.
3. MAX() on the remaining salaries gives the second-highest salary.
4. Duplicate salaries are automatically handled since MAX returns a single value.
*/


/* Example Output:
second_highest_salary
2230
*/

