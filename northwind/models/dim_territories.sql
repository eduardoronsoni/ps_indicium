with territories as (
  select * 
  from {{ source('ps-indicium-437714', 'territories')}}
--   from {{ ref('stg_territories') }}
)

select 
    * 
from territories