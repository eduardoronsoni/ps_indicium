
with raw_customers as (
  select * from raw_erp.customers
)

select
  cast(customer_id as string) as customer_id,
  company_name,
  contact_name,
  contact_title,
  address,
  city,
  region as state,
  postal_code,
  country,
  phone,
  fax
from raw_customers