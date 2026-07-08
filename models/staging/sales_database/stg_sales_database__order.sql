SELECT Column1, Column2, Column3 as status, Column4 as order_date
from {{ source('sales_database', 'order') }}