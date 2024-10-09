with raw_categories as (
  select * from raw_erp.categories
)

select
 cast(category_id as string) as category_id,
 category_name,
 description
from 
  raw_categories