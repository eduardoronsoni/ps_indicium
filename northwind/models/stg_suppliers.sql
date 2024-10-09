with suppliers as (
  select * from raw_erp.suppliers
)

select
  cast(supplier_id as string) as supplier_id,
  company_name as supplier_name,
  city,
  region,
  postal_code,
  country
from suppliers