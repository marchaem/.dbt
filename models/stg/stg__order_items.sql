select
order_id, 
concat(order_id,'_',item_id,'_',product_id) as orderitem_id,
product_id,
CAST(quantity as float) as quantity,
CAST(list_price as float) as list_price,
CAST(discount as float) as discount
FROM {{ source('localBike', 'order_items') }}