select 
concat(order_id,'_',item_id,'_',product_id) as orderitem_id,
quantity,
CAST(list_price as float) as price,
CAST(discount as float) as discount
FROM {{ source('localBike', 'order_items') }}