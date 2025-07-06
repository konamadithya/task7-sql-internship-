
-- task6_subqueries.sql

-- Scalar Subquery Example
SELECT name, (SELECT MAX(salary) FROM employees) AS highest_salary FROM employees;

-- Correlated Subquery Example
SELECT e1.name, e1.salary
FROM employees e1
WHERE e1.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e1.department_id = e2.department_id);

-- Subquery with IN
SELECT name FROM employees WHERE department_id IN (SELECT id FROM departments WHERE location = 'New York');

-- Subquery with EXISTS
SELECT name FROM employees e
WHERE EXISTS (SELECT 1 FROM projects p WHERE p.employee_id = e.id);

-- Subquery in FROM clause (Derived Table)
SELECT dept_avg.dept_id, dept_avg.avg_salary
FROM (SELECT department_id AS dept_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id) AS dept_avg;
