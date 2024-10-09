with employee_territories as (
  select * from `raw_erp.employee_territories`
)

select
  cast(employee_id as string) as employee_id,
  cast(territory_id as string) as territory_id
from employee_territories