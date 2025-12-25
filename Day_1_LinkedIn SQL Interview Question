# Day 1

# Question
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

# Solution
# CTE
WITH candidate AS (SELECT candidate_id, COUNT(SKILL) AS skill_count FROM candidates
WHERE skill in('Python','Tableau','PostgreSQL')
GROUP BY candidate_id)
SELECT candidate_id FROM candidate WHERE skill_count=3;
# We created a CTE with a candidate having a skill count. Keep in mind, the problem is asking for candidates who have ALL THREE of these skills, so we filter out those candidates whose skill count is 3.
# Alternate
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
# We group the candidates table by candidate ID using the GROUP BY clause and count the number of skills for each group using the COUNT() function. 
In the last step, we'll use the HAVING clause to select only candidates with three skills and ORDER BY the candidate ID, as per the task.
