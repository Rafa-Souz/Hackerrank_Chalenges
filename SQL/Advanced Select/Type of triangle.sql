select case when (((a - c) >= b or b >= (a + c)) or
    ((b - c) >= a or a >= (b + c)) or
    ((a - b) >= c or c >= (a + b))) then 'Not A Triangle'
    when a = b and a = c then 'Equilateral' 
    when (a = b or b = c or a = c) then 'Isosceles' 
    when a <> b and b <> c and a <> c then 'Scalene'
  end 
from triangles 