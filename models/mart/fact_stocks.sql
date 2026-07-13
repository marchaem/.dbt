select
    store_id,
    brand_id,
    product_id,
    stocks
from {{ ref('int__stocks') }} as stocks
