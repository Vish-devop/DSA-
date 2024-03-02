-- Problem (1): Select Query(I)
/*Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

Query:  */ 
select * from city 
where population>100000 and CountryCode like 'USA%';

-- Problem (2): Select Query(II)
/*
Problem Stmt: 
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
*/
select Name from City 
where population > 120000 and CountryCode like 'USA%';

-- Problem (3): Select ALL 
-- Problem Stmt: Query all columns (attributes) for every row in the CITY table.
-- Explanation: Using * for querying all the columns.
select * from city;

/* 
Problem (4): Select By ID.
Problem Stmt: Query all columns for a city in CITY with the ID 1661.
Explanation: Using the like Operator.
*/
select * from city
where ID like '1661';

/*
- Problem (5): Japenese Cities' Attributes
- Problem Stmt: Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan  is JPN.
- Explanation: Using the like operator
*/
select * from city 
where countrycode like 'JPN';

/* 
- Problem (6): Japenese Cities' Names
- Problem Stmt: Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
- Explanation: Using like operator
*/
select name from city
where countrycode like "JPN";

/* 
- Problem (7): Weather Observation Station 1
- Problem Stmt: Query a list of CITY and STATE from the STATION table.
*/
select city, state from station;

/* 
- Problem (8): Weather Observation Station 3
- Problem Stmt: Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
- Explanation: For uniqueness, I used 'DISTINCT'  and for printing even IDs' used -> 'ID%2=0'
*/
select distinct city from station
where id%2=0;

/* 
- Problem (9): Weather Observation Station 4
- Problem stmt: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
- Explanation: using the '-' symbol 
*/
select count(city)-count(distinct(city)) from station;

/* 
- Problem (10): Weather Observation Station 6
- Problem Stmt: Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
- Explaation: Used the regular expression : REGEXP "^[].*"
*/
select distinct(city) from station
where city REGEXP "^[aeiou].*";

/*
- Problem (11): Weather Observation Station 7
- Problem Stmt: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
- Explantion: Using '$' with REGEXP; as '$' indicates end of string. 
*/ 
select distinct(city) from station 
where city REGEXP "[aeiou]$";

/* 
- Problem (12): Weather Observation Station 8
- Problem Stmt: Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
- Explanation: using both metacharaters -> '^' for starting && '$' for ending but also using '.' for adding both.
*/
select distinct(city) from station
where city REGEXP "^[aeiou].*[aeiou]$";

/*
- Problem (13): Weather Observation Station 9
- Problem Stmt: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
- Explanation: Used NOT and same REGEXP '^[aeiou]'
*/
select distinct(city) from station 
where city NOT REGEXP '^[aeiou]';

/*
- Problem (14): Weather Observation Station 10
- Problem Stmt: Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
select distinct(city) from station
where city not REGEXP "[aeiou]$";

/*
- Problem (15): Weather Observation Station 11
- Problem Stmt: Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
select distinct(city) from station
where city not REGEXP "^[aeiou].*[aeiou]$";

/*
- Problem (16): Weather Observation Station 12
- Problem Stmt: Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
select distinct(city) from station
where city not REGEXP "^[aeiou]" 
and city not REGEXP "[aeiou]$";

/*
- Problem (17): Higher than 75 Marks
- Problem Stmt: Query the Name of any student in STUDENTS who scored higher than 75  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
- Explanation: used SUBSTRING function for finding the last 3 characters. 
*/
select name 
from STUDENTS
where Marks>75
order by SUBSTRING(name,-3) 
id asc;

/* 
- Problem (18): Employee Names
- Problem Stmt: Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
- Explanation: used order by clause and also specified the column name into asc order. 
*/
select name 
from employee
order by name asc;

/* 
- Problem (19): Employee salaries
- Problem stmt: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
*/
select name 
from employee
where salary> 2000
and months < 10
order by employee_id asc; 

/* 
- Problem (20): revising aggregations - the count function 
- Problem stmt: Query a count of the number of cities in CITY having a Population larger than 10000.
*/
select count(*)
from city
where population > 100000;

/*
- Problem (21): Revising Aggregations - The Sum Function
- Problem stmt: Query the total population of all cities in CITY where District is California.
*/
select sum(population) 
from city 
where district like "california";

/*
- Problem (22): Revising Aggregations - Averages
- Problem stmt: Query the average population of all cities in CITY where District is California.
- Explaation: used avg() function
*/
select avg(population) 
from city 
where district = 'california';

/*
- Problem (23): Average Population
- Problem stmt: Query the average population for all cities in CITY, rounded down to the nearest integer.
- Explanation: using round function -> round(avg())
*/
select round(avg(population))
from city;

/* 
- Problem (24): Japan Population
- Problem stmt: Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/
select sum(population) 
from city
where countrycode = "jpn";

/*
- Problem (25): Population Density Difference
- Problem stmt: Query the difference between the maximum and minimum populations in CITY.
*/
select max(population) - min(population) 
from city;

/*
- Problem (26): Average Population of each continent
- Problem Stmt: Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Explanation: Using Full-Join && ON -> used for specifying the condition in join.
*/
select country.continent,
        floor(avg(city.population))
    from city
join country on city.countrycode=country.Code
group by country.continent;

/*
- Problem (27): African Cities
- Problm stmt: Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
- Explanation: used full join.
*/
select city.name 
from city
join country on city.countrycode=country.Code
where country.continent='Africa';

/*
- Problem (28): Population Census
- Problem stmt: Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
*/
select sum(city.population) 
from city
join country on country.code=city.countrycode
where country.continent='Asia';

/*
Problem (29): Weather Observation Station 13
Problem Stmt: Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
*/
select round(sum(lat_n),4)
from station
where lat_n > 38.7880 and lat_n < 137.2345;

/*
Problem (30): Weather Observation Station 14
Problem Stmt: Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
*/
select round(max(lat_n),4)
from station
where lat_n < 137.2345;

/*
Problem (31): Weather Observation Station 15
Problem Stmt: Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your 4 answer to  decimal places.
*/
select round(long_w,4)
from station
where lat_n = 
(select max(lat_n)
from station
where lat_n < 137.2345);

/*
- Problem (32): Weather Observation Station 16
- Problem stmt: Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
*/
select round(lat_n,4)
from station
where lat_n = 
(select min(lat_n)
from station
where lat_n > 38.7780);

/* 
- Problem (33): Weather Observation Station 17
- Problem stmt: Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780 . Round your answer to 4 decimal places.
*/
select round(long_w,4)
from station
where lat_n = 
(select min(lat_n)
from station
where lat_n > 38.7780);

/*
- Problem (34): Weather Observation Station 18
- Problem stmt: Consider p1(a,b) and p2(c,d) to be two points on a 2D plane.

 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.
*/
select round(max(lat_n)-min(lat_n) + max(long_w)-min(long_w),4) from station;

/*
- Problem (35): Top Earns
- Problem stmt: We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
*/
select max(salary * months), count(*) 
from employee
where salary*months=
(select max(salary*months)
from employee);

/*
Problem (36): The Blunder
Problem stmt: Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  actual - miscalculated  average monthly salaries), and round it up to the next integer.
*/
select ceil(avg(salary) - avg(cast(replace(salary, "0", '') as float)))
from employees;