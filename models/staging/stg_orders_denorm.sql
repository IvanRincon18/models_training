select
  cast(order_id as int64) as order_id,
  cast(order_date as date) as order_date,

  cast(customer_id as string) as customer_id,
  trim(customer_name) as customer_name,
  lower(trim(customer_email)) as customer_email,
  trim(customer_city) as customer_city,
  trim(customer_state) as customer_state,

  cast(product_id as string) as product_id,
  trim(product_name) as product_name,
  trim(product_category) as product_category,

  cast(unit_price as numeric) as unit_price,
  cast(qty as int64) as qty
from {{ ref('raw_orders_denorm') }}
