-- Day 6: User Viewership by Device Type
-- Topic: CASE WHEN, Conditional Aggregation
-- Source: Ace the Data Science Interview / DataLemur

/* ---------------------------------------------------
Question:
Given a viewership table with device types
(laptop, tablet, phone), calculate:

- Total laptop viewership
- Total mobile viewership (tablet + phone)

Output columns:
- laptop_views
- mobile_views
--------------------------------------------------- */


/* ========== Solution ========== */

SELECT
    SUM(
        CASE 
            WHEN device_type = 'laptop' 
            THEN 1 
            ELSE 0 
        END
    ) AS laptop_views,
    SUM(
        CASE 
            WHEN device_type IN ('tablet', 'phone') 
            THEN 1 
            ELSE 0 
        END
    ) AS mobile_views
FROM viewership;


/*
Explanation:
1. CASE WHEN is used for conditional counting.
2. Laptop views are counted separately.
3. Mobile views combine tablet and phone views.
4. SUM aggregates total counts for each category.
*/


/* Example Output:
laptop_views | mobile_views
---------------------------
2            | 3
*/
