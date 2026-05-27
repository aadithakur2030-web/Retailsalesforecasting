WITH cleaned AS (
  SELECT
    order_id,
    customer_id,
    product_id,
    category,
    CAST(price AS FLOAT64) AS price,
    CAST(discount AS FLOAT64) AS discount,
    CAST(quantity AS INT64) AS quantity,
    payment_method,
    PARSE_DATE('%Y-%m-%d', CAST(order_date AS STRING)) AS order_date,
    PARSE_DATE('%Y-%m-%d', CAST(delivered_date AS STRING)) AS delivered_date,
    region
  FROM `retailsalesforecasting-496717.RetailSales.Data`
  WHERE price IS NOT NULL
    AND quantity > 0
)
SELECT *
FROM cleaned
LIMIT 10;

