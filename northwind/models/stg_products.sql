with products as (
  select * from raw_erp.products
)

select
  cast(product_id as string) as product_id,
  product_name,
  cast(supplier_id as string) as supplier_id,
  cast(category_id as string) as category_id,
  quantity_per_unit,
  round(cast(unit_price as float64),1) as unit_price,
  cast(units_in_stock as int) as units_in_stock,
  cast(units_on_order as int) as units_on_order,
  cast(reorder_level as int) as reorder_level,
  cast(discontinued as bool) as discontinued
from products