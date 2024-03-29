SELECT ANIMAL_ID, NAME, IF((SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%'), 'O', 'X') AS '중성화'
FROM ANIMAL_INS;

/*
IF 보다 살짝 범용성 높은 CASE ~WHEN ~THEN ~ELSE ~END 문법을 사용했다
*/

SELECT ANIMAL_ID, NAME,
    CASE
        WHEN SEX_UPON_INTAKE LIKE 'Neutered%' THEN 'O'
        WHEN SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O'
        ELSE 'X'
    END AS '중성화'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID
