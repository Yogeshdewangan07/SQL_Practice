USE DEMO;

CREATE TABLE pairs (
	A int,
    B int
);

INSERT INTO pairs VALUES (1,2), (2,4), (2,1), (3,2), (4,2), (5,6), (6,5), (7,8);

SELECT * FROM pairs;

-- REMOVE REVERSED PAIRS
-- METHOD 1: USING JOINS
SELECT lp.* FROM pairs lp LEFT JOIN pairs rp ON lp.A = rp.B AND lp.B = rp.A
WHERE rp.A IS NULL OR lp.A < rp.A;

-- METHOD 2: CORELATED SUBQUERY
SELECT * FROM pairs p1 WHERE NOT EXISTS
(SELECT * FROM pairs p2 WHERE p1.B = p2.A AND p1.A = p2.B AND p1.A > p2.A);
