select 
store_id,
product_id
quantity
from {{ source('localBike', 'stocks') }}