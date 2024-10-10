WITH cliente_do_pedido AS (
    SELECT
        order_id,
        customer_id
    FROM
        {{ ref('fact_orders') }}  -- Referencia a tabela 'fact_orders' no dbt
),

qtd_compras AS (
    SELECT
        t2.customer_id,
        product_name,
        COUNT(*) AS qtd_vezes_comprou
    FROM
        {{ ref('dim_order_details') }} AS t1  -- Referencia a tabela 'dim_order_details' no dbt
    LEFT JOIN
        cliente_do_pedido AS t2
    ON
        t1.order_id = t2.order_id
    GROUP BY
        customer_id, product_name
),

primeiros_ranking AS (
    SELECT
        customer_id,
        product_name,
        qtd_compras.qtd_vezes_comprou,
        RANK() OVER (PARTITION BY customer_id ORDER BY qtd_compras.qtd_vezes_comprou DESC) AS produto_mais_comprado
    FROM
        qtd_compras
)

SELECT
    customer_id,
    product_name,
    qtd_vezes_comprou
FROM
    primeiros_ranking
WHERE
    produto_mais_comprado = 1
