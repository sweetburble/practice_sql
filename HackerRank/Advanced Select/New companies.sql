/*
company_code, 창업자 이름, 총 리드 매니저 수 총 시니어 매니저 수, 총 매니저 수, 총 직원수를 출력하는 쿼리를 작성하세요. 
company_code 기준으로 오름차순으로 출력되어야 합니다.

Note 
테이블에 중복된 레코드가 있을 수 있습니다.
회사 코드는 문자열 형태이므로 숫자로 정렬해서는 안됩니다. 
EX) 회사코드가 C_1, C_2, C_10인 경우, 오름차순으로 정렬된 회사 코드는 C_1, C_10, C_2가 됩니다.

모든 테이블을 다 JOIN 하려 했으나, 
Employee 테이블 구조 상 이미 다른 테이블의 정보가 다 포함되어 있다고 판단하여 Employee 테이블을 기준으로 쿼리 작성하면 된다!
*/

select C.company_code, C.founder,
    count(distinct E.lead_manager_code),
    count(distinct E.senior_manager_code),
    count(distinct E.manager_code),
    count(distinct E.employee_code)
from Employee E
left join Company C 
ON E.company_code = C.company_code
group by C.company_code, C.founder
order by C.company_code asc;
