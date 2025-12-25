-- Day 1: LinkedIn SQL Interview Question
-- Topics: HAVING, GROUP BY, CTE
-- Source: DataLemur

/* ---------------------------------------------------
Question:
Given a table of candidates and their skills, find
the candidates who are proficient in Python, Tableau,
and PostgreSQL.

Return candidate_id values sorted in ascending order.
--------------------------------------------------- */


/* ========== Solution 1: Using CTE ========== */

WITH candidate_skills AS (
    SELECT 
        candidate_id,
        COUNT(skill) AS skill_count
    FROM candidates
    WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
    GROUP BY candidate_id
)
SELECT candidate_id
FROM candidate_skills
WHERE skill_count = 3
ORDER BY candidate_id;


/* 
Explanation:
- Filter required skills using WHERE
- Count skills per candidate
- Keep only candidates who have all 3 required skills
*/


/* ========== Solution 2: Using GROUP BY + HAVING ========== */

SELECT 
    candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;


/*
Explanation:
- GROUP BY candidate_id to aggregate skills
- HAVING filters candidates with exactly 3 required skills
- ORDER BY ensures ascending candidate_id
*/
