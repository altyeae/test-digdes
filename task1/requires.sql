Напишите запросы, которые выведут:
1. Сотрудника с максимальной заработной платой.
SELECT * 
FROM sys.employee as employees 
WHERE employees.salary = (SELECT MAX(salary) FROM Employee);

2. Вывести одно число: максимальную длину цепочки руководителей по таблице сотрудников (вычислить глубину дерева).
WITH RECURSIVE manager_chain AS (
  SELECT id, name, 1 AS chain_length
  FROM employee
  WHERE chief_id IS NULL
  UNION ALL
  SELECT e.id, e.name, mc.chain_length + 1
  FROM employee e
  JOIN manager_chain mc ON e.chief_id = mc.id
)
SELECT MAX(chain_length) as max_chain_length
FROM manager_chain;

3. Отдел, с максимальной суммарной зарплатой сотрудников. 
WITH depart_salary AS 
	(SELECT department_id, sum(salary) AS salary
	FROM employee 
	GROUP BY department_id)
SELECT department_id
FROM depart_salary
WHERE depart_salary.salary = (SELECT max(salary) FROM depart_salary);

4. Сотрудника, чье имя начинается на «Р» и заканчивается на «н».
SELECT * 
FROM sys.employee as employees 
WHERE Name LIKE 'Р%'
and Name LIKE '%н' 