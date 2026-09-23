USE employee_performance;

-- 1. Quarterly average performance
SELECT quarter, ROUND(AVG(performance_score), 2) AS avg_score
FROM performance_quarterly
GROUP BY quarter
ORDER BY quarter;

-- 2. Employees with the strongest average performance
SELECT e.employee_id, e.employee_name, e.department,
       ROUND(AVG(p.performance_score), 2) AS avg_score
FROM employees e
JOIN performance_quarterly p ON e.employee_id = p.employee_id
GROUP BY e.employee_id, e.employee_name, e.department
ORDER BY avg_score DESC;

-- 3. Performance gaps by department
SELECT e.department,
       ROUND(AVG(p.target_score - p.performance_score), 2) AS avg_gap
FROM employees e
JOIN performance_quarterly p ON e.employee_id = p.employee_id
GROUP BY e.department
ORDER BY avg_gap DESC;

-- 4. Employees needing improvement in the latest quarter
SELECT e.employee_id, e.employee_name, e.department,
       p.performance_score, p.target_score
FROM employees e
JOIN performance_quarterly p ON e.employee_id = p.employee_id
WHERE p.quarter = 'Q4'
  AND p.performance_score < p.target_score
ORDER BY (p.target_score - p.performance_score) DESC;
