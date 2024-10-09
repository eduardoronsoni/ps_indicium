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
  select * 
  from {{ source('ps-indicium-437714', 'order_details')}}
--   from {{ ref('stg_order_details') }}
)


  select 
    t1.*,
    t2.supplier_name,
    t2.region as supplier_region,
    t2.city as supplier_city,
    t2.country as supplier_country
  from products as t1
  left join suppliers as t2
    on t1.supplier_id = t2.supplier_id
