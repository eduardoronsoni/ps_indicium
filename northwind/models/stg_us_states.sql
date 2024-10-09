with us_states as (
  select * from raw_erp.us_states
)

select
  cast(state_id as string) as state_id,
  state_name,
  state_abbr,
  --concat(lower(replace(coalesce(state_region, ''), 'mid', '')), 'ern') as state_region
  concat(lower(state_region), 'ern') as state_region
from us_states