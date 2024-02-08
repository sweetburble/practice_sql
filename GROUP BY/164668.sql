SELECT U.USER_ID, U.NICKNAME, SUM(if(B.STATUS = 'DONE', PRICE, 0)) AS TOTAL_SALES
FROM USED_GOODS_BOARD B
INNER JOIN USED_GOODS_USER U
ON B.WRITER_ID = U.USER_ID
GROUP BY B.WRITER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES ASC;

/*
24/02/08 - 추가사항
그냥 간단하게 WHERE절에 B.STATUS = 'DONE'이라는 조건을 추가했다.
*/
SELECT U.USER_ID, U.NICKNAME, SUM(B.PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD B
INNER JOIN USED_GOODS_USER U
ON B.WRITER_ID = U.USER_ID
WHERE STATUS = 'DONE'
GROUP BY U.USER_ID
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES ASC
