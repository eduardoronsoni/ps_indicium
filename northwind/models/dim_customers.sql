with us_states as (
  select * 
  from {{ source('ps-indicium-437714', 'us_states')}}
  -- from {{ ref('stg_us_states') }}
),

customers as (
  select * 
  from {{ source('ps-indicium-437714', 'customers')}}
  -- from {{ ref('stg_customers') }}
)

select
  t1.*,
  t2.state_name,
  t2.state_region as region
from customers as t1
left join us_states as t2 
  on t1.state = t2.state_abbr 
  and t1.country = 'USA'