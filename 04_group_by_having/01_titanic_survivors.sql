-- StrataScratch ID: 9881
-- Problem: Titanic Survivors and Non-Survivors
-- Topic: GROUP BY, CASE WHEN, Conditional Aggregation

SELECT
    survived,
    SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class,
    SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class,
    SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY survived;
