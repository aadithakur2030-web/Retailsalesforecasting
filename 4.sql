WITH cleaned AS (
  SELECT
    CAST(price AS FLOAT64) AS price,
    CAST(quantity AS INT64) AS quantity,
    PARSE_DATE('%Y-%m-%d', CAST(order_date AS STRING)) AS order_date
  FROM `retailsalesforecasting-496717.RetailSales.Data`
  WHERE price IS NOT NULL AND quantity > 0
)
SELECT
  FORMAT_DATE('%Y-%m', order_date) AS month,
  SUM(price * quantity) AS monthly_revenue,
  SUM(quantity) AS monthly_units
FROM cleaned
GROUP BY month
ORDER BY month;
