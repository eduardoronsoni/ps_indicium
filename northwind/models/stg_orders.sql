WITH
  orders AS (
  SELECT
    *
  FROM
    raw_erp.orders )
SELECT
  CAST(order_id AS string) AS order_id,
  customer_id,
  CAST(employee_id AS string) AS employee_id,
  CAST(order_date AS date) AS order_date,
  CAST(required_date AS date) AS required_date,
  CAST(shipped_date AS date) AS shipped_date,
  CAST(ship_via AS string) AS ship_via,
  ROUND(CAST(freight AS float64),1) AS freight,
  ship_name,
  ship_address,
  ship_city,
  ship_region,
  ship_postal_code,
  ship_country
FROM
  orders