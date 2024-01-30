SELECT ROUND(LAT_N, 4)
FROM (SELECT ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
            COUNT(*) OVER () AS n,
            LAT_N
     FROM STATION) AS t
WHERE CASE
        WHEN MOD(n, 2) = 1 THEN row_num = (n + 1) / 2
        ELSE row_num IN (n/2, (n/2) + 1)
      END

/*
1. 중앙값의 위치를 구하려면...
1-1) 데이터가 홀수개일 경우 : (n + 1) / 2

1-2) 데이터가 짝수개일 경우 : (n / 2)와 (n / 2) + 1 둘다 중앙값이라고 할 수있다.

2. ROW_NUMBER()는 OVER (ORDER BY LAT_N)와 함께 쓰여서 LAT_N을 오름차순으로 정렬한 행 번호를 붙여준다.

3. CASE ~ END 문법을 사용했다. 내부에는 보다시피 WHEN ~ THEN ~ ELSE로 구성된다.
*/
