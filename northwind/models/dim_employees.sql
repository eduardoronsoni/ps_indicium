with employees as (
  select * 
  from {{ source('ps-indicium-437714', 'employees')}}
  -- from {{ ref('stg_territories') }}
)

select
    *
from employees