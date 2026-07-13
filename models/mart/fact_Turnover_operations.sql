select
    int_orders.order_id,
    int_orders.total_CA as CA,
    orders.staff_id as staff_id,
    orders.store_id as store_id
from {{ ref('int__orders_operations') }} as int_orders
left join {{ ref('stg__orders') }} as orders on orders.order_id=int_orders.order_id
