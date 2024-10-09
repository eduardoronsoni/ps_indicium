with shippers as (
  select * from raw_erp.shippers
)

select
  cast(shipper_id as string) as shipper_id,
  company_name
from shippers