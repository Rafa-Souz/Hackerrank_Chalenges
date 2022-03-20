SELECT concat(name,'(',substring(occupation,1,1),')')
FROM OCCUPATIONS
order by name

select concat('There are a total of ',count(occupation),' ',LOWER(occupation),'s.')
FROM OCCUPATIONS
group by occupation
order by count(occupation)