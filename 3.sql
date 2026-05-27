WITH cleaned AS (
  SELECT
    customer_id,
    CAST(price AS FLOAT64) AS price,
    CAST(quantity AS INT64) AS quantity
  FROM `retailsalesforecasting-496717.RetailSales.Data`
  WHERE price IS NOT NULL AND quantity > 0
)
SELECT
  customer_id,
  COUNT(*) AS total_orders,
  SUM(price * quantity) AS total_spent,
  AVG(quantity) AS avg_items_per_order
FROM cleaned
GROUP BY customer_id
HAVING total_orders > 1
ORDER BY total_spent DESC
LIMIT 20;
