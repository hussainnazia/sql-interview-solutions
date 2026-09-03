--question-We have a table with employees and their salaries; however, some of the records are old and contain outdated salary information. Since there is no timestamp, assume salary is non-decreasing over time. You can consider the current salary for an employee is the largest salary value among their records. If multiple records share the same maximum salary, return any one of them. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order

with ranked as
( select id,first_name, last_name, department_id,salary,
row_number()
over(partition by id order by salary  desc)as rn from ms_employee_salary
)
select id, first_name, last_name, department_id,salary
from ranked
where rn =1
order by id;
