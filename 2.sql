WITH cleaned AS (
  SELECT
    category,
    CAST(price AS FLOAT64) AS price,
    CAST(discount AS FLOAT64) AS discount,
    CAST(quantity AS INT64) AS quantity
  FROM `retailsalesforecasting-496717.RetailSales.Data`
  WHERE price IS NOT NULL AND quantity > 0
)
SELECT
  category,
  SUM(price * quantity) AS gross_revenue,
  SUM((price - discount) * quantity) AS net_revenue,
  ROUND(SUM(discount * quantity),2) AS total_discount_given
FROM cleaned
GROUP BY category
ORDER BY net_revenue DESC;
