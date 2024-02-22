SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT CODE
                   FROM SKILLCODES
                   WHERE NAME = 'C#') > 0 OR
      SKILL_CODE & (SELECT CODE
                   FROM SKILLCODES
                   WHERE NAME = 'PYTHON') > 0
ORDER BY ID ASC

/*
비트연산
- | : 비트연산 OR 의 연산자이다.
- 예 : select 29 | 15;

- & : 비트연산 AND 의 연산자이다.
- 예 : select 29 & 15;

- << : 비트연산 OR 의 연산자이다.
- 예 : select 1 << 2;

- >> : 비트연산 OR 의 연산자이다.
- 예 : select 4 >> 2;

- BIT_COUNT(N) : 해당 값의 비트수를 반환한다.
- 예 : select BIT_COUNT(29);

- 주의 : 연산은 BIGINT 의 결과값을 가지게 되므로 BIGINT 의 범위를 벗어나게 되면 잘못된 값을 반환한다.

[CONV 사용해 10진수에서 2진수, 8진수, 16진수로 진법 데이터 형변환 실시]
1. CONV : 숫자 기반 시스템을 다른 진법의 수로 표시해줍니다
2. CONV(데이터, 원본 진법, 변환할 진법) 으로 문법을 사용합니다
*/
