with regions as (
  select * 
  from {{ source('ps-indicium-437714', 'regions')}}
--   from {{ ref('stg_regions') }}
)

select 
    * 
from regions