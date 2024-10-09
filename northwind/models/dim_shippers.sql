with shippers as (
  select * 
  from {{ source('ps-indicium-437714', 'shippers')}}
--   from {{ ref('stg_shippers') }}
)

select 
    * 
from shippers