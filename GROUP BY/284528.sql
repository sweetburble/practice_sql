WITH HR_WITH_GRADE AS(SELECT
                        CASE 
                            WHEN AVG(SCORE) >= 96 THEN 'S'
                            WHEN AVG(SCORE) >= 90 THEN 'A'
                            WHEN AVG(SCORE) >= 80 THEN 'B'
                            ELSE 'C'
                        END AS GRADE, EMP_NO
                      FROM HR_GRADE
                      GROUP BY EMP_NO)

SELECT E.EMP_NO, E.EMP_NAME, G.GRADE,
        CASE 
            WHEN G.GRADE = 'S' THEN E.SAL * (20 / 100)
            WHEN G.GRADE = 'A' THEN E.SAL * (15 / 100)
            WHEN G.GRADE = 'B' THEN E.SAL * (10 / 100)
            ELSE 0
        END AS BONUS
FROM HR_EMPLOYEES E
INNER JOIN HR_WITH_GRADE G
ON E.EMP_NO = G.EMP_NO
ORDER BY E.EMP_NO ASC
