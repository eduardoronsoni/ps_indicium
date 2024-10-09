with orders as (
  select * 
  from {{ source('ps-indicium-437714', 'orders')}}
--   from {{ ref('stg_orders') }}
),


orders_with_price as (
SELECT
  order_id,
  product_id,
  unit_price,
  quantity,
  discount,
  (unit_price * quantity) * (1 - discount) AS full_price
FROM
  {{ source('ps-indicium-437714', 'order_details')}}),


prices_per_order as (
  select 
    order_id,
    round(sum(full_price),2) as full_price
  from orders_with_price
  group by order_id
)


select
    t1.*,
    t2.full_price
from orders as t1
left join prices_per_order as t2 on t1.order_id = t2.order_id