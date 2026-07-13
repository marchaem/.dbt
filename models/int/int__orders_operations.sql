with orders_grouped as (
    select
        ord.order_id as order_id,
        sum(ord_it.list_price*ord_it.quantity*(1-ord_it.discount)) as total_CA
    from {{ ref('stg__orders') }} as ord
    left join {{ ref('stg__order_items') }} as ord_it on ord_it.order_id=ord.order_id
    group by ord.order_id
)

select
    ord.order_id as order_id,
    ord.total_CA as total_CA
from orders_grouped as ord
