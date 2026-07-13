select 
    brand_id,
    category_id,
    product_id,
    total_CA as CA
from {{ ref('int__orders_brand') }} as orders_brand
