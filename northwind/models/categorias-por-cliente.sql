-- models/most_combined_categories.sql

WITH CombinedSales AS (
    SELECT 
        o.customer_id,
        o.order_id,
        od.product_id,
        od.category_name
    FROM 
        {{ ref('fact_orders') }} o
    JOIN 
        {{ ref('dim_order_details') }} od ON o.order_id = od.order_id
),
ProductCombinations AS (
    SELECT 
        cs.customer_id,
        a.category_name AS category_name_a,
        b.category_name AS category_name_b,
        COUNT(DISTINCT cs.order_id) AS combination_count
    FROM 
        CombinedSales cs
    JOIN 
        CombinedSales a ON cs.order_id = a.order_id AND cs.product_id < a.product_id
    JOIN 
        CombinedSales b ON cs.order_id = b.order_id AND a.product_id < b.product_id
    GROUP BY 
        cs.customer_id, category_name_a, category_name_b
),
RankedCombinations AS (
    SELECT 
        customer_id,
        category_name_a,
        category_name_b,
        combination_count,
        RANK() OVER (PARTITION BY customer_id ORDER BY combination_count DESC) AS rank
    FROM 
        ProductCombinations
)
SELECT 
    customer_id,
    category_name_a,
    category_name_b,
    combination_count
FROM 
    RankedCombinations
WHERE 
    rank = 1
ORDER BY 
    customer_id
