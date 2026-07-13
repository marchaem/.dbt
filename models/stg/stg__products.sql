select
product_id,
product_name as name,
brand_id,
category_id,
model_year,
list_price
from {{ source('localBike', 'products') }}