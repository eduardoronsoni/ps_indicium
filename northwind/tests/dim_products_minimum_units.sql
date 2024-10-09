select 
    *
from 
    {{  ref('dim_products_and_suppliers') }}
where units_in_stock < 0