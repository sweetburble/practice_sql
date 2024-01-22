/*
1. 행과 열을 바꾸는 pivot 활용
2. 직업 아래에 이름이 표시되도록 직업 열(occupation)을 피벗 -> Doctor, Professor, Singer, Actor 순으로
3. 이름은 알파벳 순으로 정렬
*/

/*
중요 문법 1. ROW_NUMBER() OVER (PARTION BY)
기본적인 사용법, table의 데이터가 num의 오름차순이면서 순서대로 번호가 매겨져서 출력된다
SELECT ROW_NUMBER() OVER(order by num asc) as order_no
FROM table

ROW_NUMBER() OVER (PARTION BY)을 사용하는 이유는 -> 정렬과 더불어 rownum까지 주는 효과이기 때문
" 함수(함수_적용_열) OVER (PARTITION BY 그룹열 ORDER BY 순서열) "

partition by는 지정한 컬럼에서 동일한 데이터들끼리 묶어서 넘버링을 함
*/

SELECT
    MIN(CASE WHEN OCCUPATION = 'DOCTOR' THEN NAME ELSE NULL END),
    MIN(CASE WHEN OCCUPATION = 'PROFESSOR' THEN NAME ELSE NULL END),
    MIN(CASE WHEN OCCUPATION = 'SINGER' THEN NAME ELSE NULL END),
    MIN(CASE WHEN OCCUPATION = 'ACTOR' THEN NAME ELSE NULL END)
FROM (SELECT OCCUPATION, NAME, ROW_NUMBER() OVER(PARTITION BY OCCUPATION ORDER BY NAME) rn 
      FROM OCCUPATIONS) AS tmp
GROUP BY tmp.rn
