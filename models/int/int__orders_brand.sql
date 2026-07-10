with orders_grouped_by_order_items as (
    select 
        ord.order_id,
        sum(ord_it.list_price * ord_it.quantity * (1 - ord_it.discount)) as total_CA
    from {{ ref('stg__orders') }} as ord
    left join {{ ref('stg__order_items') }} as ord_it on ord.order_id = ord_it.order_id
    group by ord.order_id
),

product_summary as (
    select
        ord_it.order_id as order_id, 
        products.product_id as product_id,
        brands.brand_id as brand_id,
        cat.category_id as category_id,
        sum(ord_it.list_price * ord_it.quantity * (1 - ord_it.discount)) as total_CA
    from {{ ref('stg__order_items') }} as ord_it
    left join {{ ref('stg__products') }} as products on products.product_id = ord_it.product_id
    left join {{ ref('stg__brands') }} as brands on brands.brand_id = products.brand_id
    left join {{ ref('stg__categories') }} as cat on cat.category_id = products.category_id
    group by ord_it.order_id, products.product_id, brands.brand_id, cat.category_id
)

select
    ord1.order_id as order_id,
    ord2.product_id as product_id,
    ord2.brand_id as brand_id,
    ord2.category_id as category_id,
    ord2.total_CA as total_CA
from orders_grouped_by_order_items as ord1
left join product_summary as ord2 on ord1.order_id = ord2.order_id