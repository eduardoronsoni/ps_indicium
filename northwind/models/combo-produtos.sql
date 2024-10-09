WITH product_combo AS (
  SELECT
    t1.order_id,
    t1.product_name AS product_1,
    t2.product_name AS product_2
  FROM {{ ref('dim_order_details') }} AS t1
  LEFT JOIN {{ ref('dim_order_details') }} AS t2 ON t1.order_id = t2.order_id
  WHERE t1.product_id < t2.product_id
)

SELECT
    product_1,
    product_2,
    COUNT(*) AS times_combo
FROM product_combo
GROUP BY product_1, product_2
ORDER BY times_combo DESC
