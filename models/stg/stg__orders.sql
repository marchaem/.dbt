select
concat(order_id,'_',customer_id) as order_id,
order_status,
order_date,
required_date,
shipped_date,
store_id,
staff_id
from {{ source('localBike', 'orders') }}