/*
https://www.hackerrank.com/challenges/what-type-of-triangle/problem
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
-- SGBD or DBMS (Database Management System): DB2
--Training CASE logic 
SELECT
    CASE 
        WHEN NOT (    -- If the sum of 2 sides length is not larger than the other side, you can't form a triangle
            A + B > C AND -- Testing all the 3 combinations of 2 sides in the triangle
            A + C > B AND  -- If all of the logics are not true, then we don't have a triangle
            B + C > A
        ) THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral' -- If all the sides are equal we just need to test 2 logics because if A = B and B = C then C = A
        WHEN A = B OR B = C OR C = A THEN 'Isosceles' -- If at least 2 sides are equal, we have an Isosceles Triangle
        ELSE 'Scalene'
    END AS TYPE
FROM TRIANGLES;
