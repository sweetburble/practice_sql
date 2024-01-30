SELECT ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N), 2) + POW(MAX(LONG_W)-MIN(LONG_W), 2)), 4)
FROM STATION

/*
POW(제곱할 수, 제곱횟수) 는 제곱을 계산한다
SQRT(제곱근할 수)는 제곱근을 계산한다
*/
