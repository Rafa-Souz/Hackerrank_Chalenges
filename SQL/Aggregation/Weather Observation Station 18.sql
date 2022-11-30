--MICROSOFT SQL
select (max(convert(decimal(10,4),round(lat_n,4))) - min(convert(decimal(10,4),round(lat_n,4)))) +
    (max(convert(decimal(10,4),round(long_w,4))) - min(convert(decimal(10,4),round(long_w,4))))
from station

--ORACLE SQL
select (max(round(lat_n,4)) - min(round(lat_n,4))) +
    (max(round(long_w,4)) - min(round(long_w,4)))
from station