WITH cleaned AS (
  SELECT
    region,
    CAST(price AS FLOAT64) AS price,
    CAST(quantity AS INT64) AS quantity
  FROM `retailsalesforecasting-496717.RetailSales.Data`
  WHERE price IS NOT NULL AND quantity > 0
)
SELECT
  region,
  SUM(price * quantity) AS revenue,
  COUNT(*) AS total_orders
FROM cleaned
GROUP BY region
ORDER BY revenue DESC;
