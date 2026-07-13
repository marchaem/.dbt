with product_summary as (
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
    summary.order_id as order_id,
    summary.product_id as product_id,
    summary.brand_id as brand_id,
    summary.category_id as category_id,
    summary.total_CA as total_CA
from product_summary as summary
