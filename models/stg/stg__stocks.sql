select 
concat(store_id,'_',product_id) as store_id,
quantity
from {{ source('localBike', 'stocks') }}