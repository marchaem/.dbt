SELECT
    CONCAT([order_id], '_', [product_id], '_', [seller_id]) AS [id],
    [order_id],
    [product_id],
    [seller_id],
    [pickup_limit_date],
    CAST([price] AS FLOAT) AS [price],
    CAST([shipping_cost] AS FLOAT) AS [shipping_cost],
    [quantity]
from 
    {{ source('sales_database', 'order_item') }}