select 
    *
from 
    {{  ref('dim_order_details') }}
where unit_price < 0