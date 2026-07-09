select
stores.store_id as store_id,
brands.brand_id as brand_id,
products.product_id as product_id,
sum(stocks.quantity) as quantity
from {{ ref('stg__stores') }} as stores
left join {{ ref('stg__brands') }} as brands on brands.brand_id= products.brand_id
left join {{ ref('stg__stocks') }} as stocks on stores.store_id=stocks.store_id
left join {{ ref('stg__products') }} as products on products.product_id=stocks.product_id
group by store_id,brand_id,product_id