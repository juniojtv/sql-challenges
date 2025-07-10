/*
https://www.hackerrank.com/challenges/occupations/problem
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically
and displayed underneath its corresponding Occupation.
The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order,
with their respective names listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.


*/
-- Creating a SUBQUERY in a CTE for better visualization
WITH RANK AS (
SELECT
    NAME,
    OCCUPATION,
    ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS RN -- Sorting the names for each line
FROM OCCUPATIONS
)
SELECT
  MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor, --each line contains a list of names that works at the occupation
  MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor,
  MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer,
  MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor
FROM RANK
GROUP BY RN
ORDER BY RN;
/*
Your Output (stdout)
Doctor Professor Singer Actor (HEADER)
Aamina Ashley Christeen Eve
Julia Belvet Jane Jennifer
Priya Britney Jenny Ketty
NULL Maria Kristeen Samantha
NULL Meera NULL NULL
NULL Naomi NULL NULL
NULL Priyanka NULL NULL
*/
