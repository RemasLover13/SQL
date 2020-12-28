WITH RECURSIVE orders_statistics(customer_id, month, sum) AS
(
    SELECT orders.id_customer, date_trunc('month', orders.order_date), SUM(orders.cost)
    FROM orders
    INNER JOIN (
        SELECT o1.id_customer, MIN(date_trunc('month', o1.order_date)) earliest_order_date_month
        FROM orders o1
        GROUP BY 1)
        earliest_orders ON earliest_orders.earliest_order_date_month = date_trunc('month', orders.order_date)
    GROUP BY 1, 2
    UNION ALL
    SELECT stat.customer_id, next_month_orders.order_date_month, stat.sum + next_month_orders.sum
    FROM orders_statistics stat
    INNER JOIN (
        SELECT o.id_customer, date_trunc('month', o.order_date) order_date_month, SUM(o.cost) sum
        FROM orders o
        GROUP BY 1, 2)
        next_month_orders ON next_month_orders.id_customer = stat.customer_id
            AND next_month_orders.order_date_month = date_trunc('month', stat.month) + INTERVAL '1 month'
    WHERE next_month_orders.id_customer IS NOT NULL
)
SELECT * FROM orders_statistics
ORDER BY 1, 2;
