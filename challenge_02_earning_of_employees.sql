/*
https://www.hackerrank.com/challenges/earnings-of-employees/problem
We define an employee's total earnings to be their monthly salary X months worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.
*/
SELECT 
    MAX(EARNINGS) || ' ' || COUNT(*)
FROM   
    (SELECT
      SALARY,
      MONTHS,
      SALARY * MONTHS AS EARNINGS, --calculating the earnings for each employee
      DENSE_RANK() OVER(ORDER BY SALARY * MONTHS DESC) AS RANK --ranking each employee ordered by earnings
    FROM EMPLOYEE)
WHERE RANK = 1; --choosing only the maximum total earning
