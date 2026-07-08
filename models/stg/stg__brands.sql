select
brand_id as id ,
brand_name as name
from {{ source('localBike', 'brands') }} 