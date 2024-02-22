WITH GRADE_TABLE AS(
SELECT
    CASE 
        WHEN EXISTS(SELECT S.CODE 
                    FROM SKILLCODES S 
                    WHERE S.CODE & D.SKILL_CODE AND S.NAME = 'Python') AND 
             EXISTS(SELECT S.CODE 
                    FROM SKILLCODES S 
                    WHERE S.CODE & D.SKILL_CODE AND S.CATEGORY = 'Front End') THEN 'A'
        WHEN EXISTS(SELECT S.CODE 
                    FROM SKILLCODES S 
                    WHERE S.CODE & D.SKILL_CODE AND S.NAME = 'C#') THEN 'B'
        WHEN EXISTS(SELECT S.CODE 
                    FROM SKILLCODES S 
                    WHERE S.CODE & D.SKILL_CODE AND S.CATEGORY = 'Front End') THEN 'C'
        ELSE NULL
    END AS GRADE, D.ID, D.EMAIL
FROM DEVELOPERS D
ORDER BY GRADE, ID)

SELECT *
FROM GRADE_TABLE
WHERE GRADE IS NOT NULL

/*
핵심문법
1. WITH 별칭 AS(서브쿼리)
WITH절을 사용하면, 하나 이상의 서브쿼리에서 반환된 데이터를 단일 쿼리에서 재사용할 수 있다. 
즉, AS() 안의 서브쿼리가 GRADE_TABLE이라는 임시 테이블에 담겨 아래의 SELECT 쿼리에서 사용할 수 있는 것이다

2. EXISTS 문
EXISTS는 서브쿼리(subquery)에서 반환된 결과가 존재하는지 여부를 확인하는 조건 연산자이다.
EXISTS를 사용하여 서브쿼리를 조합하면 데이터를 필터링하거나 관련된 데이터를 확인(존재하는지)하는 데 유용하게 사용할 수 있다.
*/
