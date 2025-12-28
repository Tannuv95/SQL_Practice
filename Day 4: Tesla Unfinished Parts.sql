-- Day 4: Unfinished Parts
-- Company: Tesla
-- Topic: NULL filtering
-- Source: DataLemur / Tesla SQL Interview Style

/* ---------------------------------------------------
Question:
Tesla wants to identify production bottlenecks.
Find the parts that have started assembly but are
not yet finished.

An unfinished part is defined as one with a NULL
finish_date.

Output:
- part
- assembly_step
--------------------------------------------------- */


/* ========== Solution ========== */

SELECT 
    part,
    assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;


/*
Explanation:
1. The parts_assembly table contains all parts at
   different assembly stages.
2. A NULL finish_date indicates the assembly step
   has not been completed.
3. Filtering on finish_date IS NULL returns all
   unfinished parts and their current steps.
*/


/* Example Output:
part   | assembly_step
---------------------
bumper | 3
bumper | 4
*/
