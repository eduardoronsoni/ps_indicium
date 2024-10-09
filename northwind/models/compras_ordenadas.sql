WITH compras_ordenadas AS (
    SELECT 
        customer_id,
        order_date,
        LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS data_anterior
        from {{ ref('fact_orders') }}
)

select * from compras_ordenadas


-- SELECT 
--     AVG(DATE_DIFF(order_date, data_anterior, DAY)) AS media_geral_tempo_entre_compras
-- FROM 
--     compras_ordenadas
-- WHERE 
--     data_anterior IS NOT NULL;
