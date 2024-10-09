select 
    *
from 
    {{  ref('dim_territories') }}
where region_id not in (select distinct region_id from {{  ref('dim_regions') }})