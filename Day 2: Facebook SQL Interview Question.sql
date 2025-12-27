-- Day 2: Facebook SQL Interview Question
-- Topic: LEFT JOIN, NULL filtering
-- Source: DataLemur / Facebook Interview Style

/* ---------------------------------------------------
Question:
Given two tables, `pages` and `page_likes`, return the
IDs of Facebook pages that have zero likes.

Requirements:
- Pages with no likes should be returned
- Output must be sorted by page_id in ascending order
--------------------------------------------------- */


/* ========== Solution: Using LEFT JOIN ========== */

SELECT 
    p.page_id
FROM pages p
LEFT JOIN page_likes l
    ON p.page_id = l.page_id
WHERE l.liked_date IS NULL
ORDER BY p.page_id;


/*
Explanation:
1. LEFT JOIN keeps all records from the `pages` table.
2. Pages without matching entries in `page_likes` will have NULL values.
3. Filtering on `liked_date IS NULL` selects pages with zero likes.
4. ORDER BY ensures ascending page_id as required.
*/


/* Example Output:
page_id
20701
*/
