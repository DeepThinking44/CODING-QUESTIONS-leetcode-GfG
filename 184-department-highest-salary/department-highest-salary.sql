WITH Pradeep AS (
    SELECT
        e.id,
        e.name AS employee_name,
        e.salary,
        d.name AS department_name,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS dr
    FROM
        Employee AS e
    LEFT JOIN
        Department AS d ON d.id = e.departmentId
)
SELECT
    p.department_name AS Department,
    p.employee_name AS Employee,
    p.salary AS Salary
FROM
    Pradeep AS p
WHERE
    p.dr <= 1
ORDER BY
    p.department_name, 
    p.salary DESC;
