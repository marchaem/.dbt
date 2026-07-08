SELECT price
from {{ref('order_item') }}
where price < 0