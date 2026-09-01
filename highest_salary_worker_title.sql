-- Question:
-- Find the job title(s) of the workers with the highest salary
-- among workers who have a matching record in the title table.
-- If multiple workers share the highest salary, include all titles.
-- Sort the titles alphabetically.

SELECT worker_title
FROM worker
JOIN title
    ON worker.worker_id = title.worker_ref_id
WHERE salary = (
    SELECT MAX(salary)
    FROM worker
    JOIN title
        ON worker.worker_id = title.worker_ref_id
)
ORDER BY worker_title;
