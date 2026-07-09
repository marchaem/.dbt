select
quantity
from {{ ref('stg__order_items') }}
where quantity < 0