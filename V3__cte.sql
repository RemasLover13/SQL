WITH cte_select AS (
    SELECT *
    FROM PROMOCODE
)

SELECT * FROM cte_select;

UPDATE ORDERS
SET order_date = cte.date
FROM cte
WHERE ORDERS.jobid = cte.order_date
