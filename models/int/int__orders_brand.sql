with product_summary as (
    select
        ord_it.order_id as order_id, 
        products.product_id as product_id,
        sum(ord_it.list_price * ord_it.quantity * (1 - ord_it.discount)) as total_CA
    from {{ ref('stg__order_items') }} as ord_it
    left join {{ ref('stg__products') }} as products on products.product_id = ord_it.product_id
    group by ord_it.order_id, products.product_id
)

select
    summary.order_id as order_id,
    summary.product_id as product_id,
    summary.total_CA as total_CA
from product_summary as summary
