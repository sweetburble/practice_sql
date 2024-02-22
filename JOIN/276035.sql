SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM (SELECT CASE
                WHEN EXISTS(SELECT CODE
                           FROM SKILLCODES S
                           WHERE S.CATEGORY = 'FRONT END' AND D.SKILL_CODE & S.CODE) THEN 'A'
                ELSE NULL
             END AS GRADE, D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
      FROM DEVELOPERS D) GD
WHERE GRADE IS NOT NULL
ORDER BY ID ASC

/*
비슷한 다른 문제에서도 이미 사용했었지만 이 쿼리의 특이한 점은
FROM 절을 보면 join이라고 명시하지 않았는데 서브쿼리를 사용하면서 자연스럽게 join한 것처럼 Alias를 통해서 칼럼을 사용할 수 있다는 것이다.
*/
