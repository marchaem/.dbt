select 
category_id as id,
category_name as name
from {{ source('localBike', 'categories') }}