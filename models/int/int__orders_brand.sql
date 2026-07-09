with orders_grouped_by_order_items as (
    select ord.order_id,
    sum(ord_it.list_price*ord_it.quantity*(1-ord_it.discount)) as total_CA
    from {{ ref('stg__orders') }} as ord
    left join {{ ref('stg__order_items') }}  as ord_it on ord.order_id=ord_it.order_id
    group by ord.order_id
),

product_summary as (
    select
    orders.order_id as order_id,
    products.product_id as product_id,
    brands.brand_id as brand_id as brand_id,
    cat.category_id as category_id
    from {{ ref('stg__orders') }} as orders
    left join  {{ ref('stg__products') }} as products on products.product_id=orders.product_id
    left join {{ ref('stg__brands') }} as brands on brands.brand_id=products.product_id
    left join {{ ref('stg__categories') }} as cat on cat.category_id= products.category_id
    group by order_id,product_id,brand_id,category_id
)

select
ord1.order_id,
ord2.product_id,
ord2.brand_id,
ord2.category_id,
ord1.total_CA
from order_grouped_by_order_items as ord1
left join product_summary as ord2 on ord1.order_id=ord2.order_id 