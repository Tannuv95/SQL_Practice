-- Day 5: Time Spent Sending vs Opening Snaps
-- Company: Snapchat
-- Topic: CASE WHEN, Aggregation, JOIN, Percentage Calculation
-- Source: Ace the Data Science Interview / DataLemur

/* ---------------------------------------------------
Question:
Given user activity data and age groups, calculate
the percentage of time spent sending vs opening snaps
for each age bucket.

Requirements:
- Group results by age_bucket
- Calculate percentages using:
    send / (send + open)
    open / (send + open)
- Multiply by 100.0 to avoid integer division
- Round percentages to 2 decimal places
--------------------------------------------------- */


/* ========== Solution ========== */

SELECT  
    b.age_bucket,
    ROUND(
        SUM(CASE 
                WHEN a.activity_type = 'send' 
                THEN a.time_spent 
                ELSE 0 
            END)
        / SUM(a.time_spent) * 100.0,
        2
    ) AS send_perc,
    ROUND(
        SUM(CASE 
                WHEN a.activity_type = 'open' 
                THEN a.time_spent 
                ELSE 0 
            END)
        / SUM(a.time_spent) * 100.0,
        2
    ) AS open_perc
FROM activities a
INNER JOIN age_breakdown b 
    ON a.user_id = b.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY b.age_bucket;


/*
Explanation:
1. Join `activities` with `age_breakdown` to get age groups.
2. Filter only 'send' and 'open' activities.
3. Use CASE WHEN to separately sum send and open time.
4. Divide by total time spent (send + open).
5. Multiply by 100.0 to prevent integer division.
6. ROUND the result to 2 decimal places.
*/


/* Example Output:
age_bucket | send_perc | open_perc
----------------------------------
26-30      | 65.40     | 34.60
31-35      | 43.75     | 56.25
*/
