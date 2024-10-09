with territories as (
  select * 
  from {{ source('ps-indicium-437714', 'territories')}}
  -- from {{ ref('stg_territories') }}
),

employee_territories as (
  select * 
  from {{ source('ps-indicium-437714', 'employee_territories')}}
  -- from {{ ref('stg_employee_territories') }}
),

region as (
  select * 
  from {{ source('ps-indicium-437714', 'regions')}}
  -- from {{ ref('stg_regions') }}
)

select
  t1.*,
  t2.territory_name,
  t2.region_id,
  t3.region_name
from employee_territories as t1
left join territories as t2
  on t1.territory_id = t2.territory_id
left join region as t3
  on t2.region_id = t3.region_id
