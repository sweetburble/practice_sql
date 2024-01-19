select
    case
        when c >= a + b
        then 'Not A Triangle'
        when a = b and b = c
        then 'Equilateral'
        when (a = b and b != c) or (a = c and a != b) or (b = c and a != c)
        then 'Isosceles'
        when a != b and b != c and a != c
        then 'Scalene'
    end
from TRIANGLES
