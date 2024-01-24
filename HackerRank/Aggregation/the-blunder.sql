select CEILING(avg(salary) - avg(convert(replace(convert(Salary, CHAR), "0", "") , UNSIGNED)))
FROM EMPLOYEES

/*
놀라운 사실 -> 그냥 convery 안하고, Salary에 그대로 replace를 사용해도 된다. (아마 Salary가 실제로는 문자열로 저장된듯?)
CEILING -> CEIL만 써도 된다
*/

select CEIL(avg(salary) - avg(replace(Salary, "0", "")))
FROM EMPLOYEES
