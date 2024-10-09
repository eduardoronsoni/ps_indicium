with products as (
  select * 
  from {{ source('ps-indicium-437714', 'products')}}
--   from {{ ref('stg_products') }}
),

suppliers as (
  select * 
  from {{ source('ps-indicium-437714', 'suppliers')}}
--   from {{ ref('stg_suppliers') }}
),

order_details as (
  select 
    *,
    (unit_price * quantity) * (1 - discount) AS full_price 
  from {{ source('ps-indicium-437714', 'order_details')}}
--   from {{ ref('stg_order_details') }}
),

categories as (
  select * 
  from {{ source('ps-indicium-437714', 'categories')}}
--   from {{ ref('stg_categories') }}
),

products_and_suppliers as ( 
  select 
    t1.*,
    t2.supplier_name,
    t2.country as supplier_country
  from products as t1
  left join suppliers as t2
    on t1.supplier_id = t2.supplier_id
)

select
  t1.*,
  t2.product_name,
  t2.supplier_id,
  t2.supplier_name,
  t2.supplier_country,
  t3.category_name,
  t3.description as category_description,
  t2.discontinued
from order_details as t1
left join products_and_suppliers as t2
  on t1.product_id = t2.product_id
left join categories as t3
  on t2.category_id = t3.category_id
