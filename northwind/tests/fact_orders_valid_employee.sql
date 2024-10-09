select 
    *
from 
    {{  ref('fact_orders') }}
where employee_id not in (select distinct employee_id from {{  ref('dim_employee_territories') }})