WITH category_combo AS (
  SELECT
    t1.order_id,
    t1.category_name AS category_1,
    t2.category_name AS category_2
  FROM {{ ref('dim_order_details') }} AS t1
  LEFT JOIN {{ ref('dim_order_details') }} AS t2 ON t1.order_id = t2.order_id
  WHERE t1.category_name < t2.category_name
)

SELECT
    category_1,
    category_2,
    COUNT(*) AS times_combo
FROM category_combo
GROUP BY category_1, category_2
ORDER BY times_combo DESC
