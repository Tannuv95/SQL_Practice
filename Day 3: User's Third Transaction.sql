-- Day 3: User's Third Transaction
-- Company: Uber
-- Topic: Window Functions (ROW_NUMBER), CTE, Subquery
-- Source: Ace the Data Science Interview / DataLemur

/* ---------------------------------------------------
Question:
Given a table of Uber transactions, return the third
transaction for each user.

Output:
- user_id
- spend
- transaction_date

Exclude users with fewer than three transactions.
--------------------------------------------------- */


/* ========== Solution 1: Using CTE ========== */

WITH transaction_rank AS (
    SELECT 
        user_id,
        spend,
        transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id 
            ORDER BY transaction_date
        ) AS row_num
    FROM transactions
)
SELECT 
    user_id,
    spend,
    transaction_date
FROM transaction_rank
WHERE row_num = 3;


/*
Explanation:
- ROW_NUMBER() assigns an order to transactions per user
- PARTITION BY resets numbering for each user
- Filter row_num = 3 to get the third transaction
*/


/* ========== Solution 2: Using Subquery ========== */

SELECT 
    user_id,
    spend,
    transaction_date
FROM (
    SELECT 
        user_id,
        spend,
        transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id 
            ORDER BY transaction_date
        ) AS row_num
    FROM transactions
) ranked_transactions
WHERE row_num = 3;


/*
Explanation:
- Inner query ranks transactions per user
- Outer query filters the third transaction
- Functionally equivalent to the CTE solution
*/
