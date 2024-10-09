with territories as (
  select * from raw_erp.territories
)

select
  cast(territory_id as string) as territory_id,
  territory_description as territory_name,
  cast(region_id as string) as region_id
from territories