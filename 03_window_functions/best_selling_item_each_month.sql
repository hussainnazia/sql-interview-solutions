### Best-Selling Item for Each Month

Find the best-selling item for each month, without separating the months by year.

The best-selling item is determined by the **highest total sales amount**, calculated as:

`total_paid = unitprice * quantity`

A negative `quantity` represents a return or cancellation, and these transactions have an invoice number beginning with `'C'`. **Ignore all returns and cancellations** when calculating sales.

**Output:**

* `month`
* `description` of the best-selling item
* `total_paid`

Use the `online_retail` table.

  
WITH cte AS (
    SELECT 
        SUM(quantity * unitprice) AS total_paid,
        description,
        stockcode,
        EXTRACT(MONTH FROM invoicedate) AS month
    FROM online_retail
    WHERE invoiceno NOT LIKE 'C%'
    GROUP BY month, stockcode, description
),
rownum AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY month
               ORDER BY total_paid DESC
           ) AS rn
    FROM cte 
)
SELECT 
    month,
    description,
    total_paid
FROM rownum
WHERE rn = 1;
