with order_details as (
  select * from raw_erp.order_details
)

select 
  cast(order_id as string) as order_id,
  cast(product_id as string) as product_id,
  round(cast(unit_price as float64),1) as unit_price,
  cast(quantity as int) as quantity,
  round(cast(discount as float64),1) as discount
from order_details

