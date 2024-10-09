select 
    *
from 
    {{  ref('fact_orders') }}
where customer_id not in (select distinct customer_id from {{  ref('dim_customers') }})