with region as (
  select * from raw_erp.region
)

select
  cast(region_id as string) as region_id,
  lower(region_description) as region_name
from region