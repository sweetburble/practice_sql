select id, age, coins_needed, power
from (select w.id,
      p.age,
      w.coins_needed,
      w.power,
      ROW_NUMBER() OVER (PARTITION BY p.age, w.power ORDER BY w.coins_needed) as RN
      from Wands w inner join Wands_Property p
      on w.code = p.code
      where p.is_evil = 0) as new_t
where RN = 1
order by power desc, age desc

/*
특이사항
hackerrank의 mysql은 구버전이기 때문에 Window Function이 작동하지 않는다.
따라서 환경을 Mysql server로 변경해서 제출해야 한다.

윈도우 함수란 -> Group By와 비슷하게 데이터를 그룹화하여 집계해준다.
하지만 Group By는 집계된 결과만 보여주는 반면, 윈도우 함수는 기존 데이터에 집계된 값을 추가하여 나타낸다. 주로 중복 From절을 할 때 사용

*/
