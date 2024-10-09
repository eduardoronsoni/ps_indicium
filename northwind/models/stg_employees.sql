with employees as (
  select * from `raw_erp.employees`
)

select
  cast(employee_id as string) as employee_id,
  concat(first_name,' ',last_name) as full_name,
  title,
  hire_date,
  city,
  region,
  postal_code,
  country,
  reports_to
from employees