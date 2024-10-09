select 
    *
from 
    {{  ref('dim_products_and_suppliers') }}
where unit_price < 0