SELECT CASE WHEN G.GRADE > 7 THEN S.NAME
            ELSE null
       END as name
            ,G.GRADE, S.MARKS
FROM STUDENTS S
INNER JOIN GRADES G
ON S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY G.GRADE DESC, S.NAME ASC

/*
기존의 뻔한 조인 조건 ON에 =를 쓸 수 없다. (완전히 1:1로 같은 column이 없기 때문이다)
그 대신, GRADE가 책정되는 조건을 생각해서 BETWEEN을 ON에 사용하면 된다!
*/
