select 
category_id,
category_name
from {{ source('localBike', 'categories') }}