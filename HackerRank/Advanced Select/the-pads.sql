select concat(name, '(', LEFT(Occupation, 1), ')')
from OCCUPATIONS
order by name;

select concat("There are a total of ", count(*), " ", LOWER(occupation), "s.")
from OCCUPATIONS
group by Occupation
order by count(*), Occupation
