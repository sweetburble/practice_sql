select salary * months as earnings, count(employee_id)
from Employee
where salary * months = (select max(salary * months)
                        from Employee)
group by earnings
