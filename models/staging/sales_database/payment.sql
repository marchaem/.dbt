SELECT
    [order_id] AS [OrderID],
    [payment_sequential] AS [PaymentSequential],
    [payment_type] AS [PaymentType],
    [payment_installments] AS [PaymentInstallments],
    [payment_value] AS [PaymentValue]
from {{ source('sales_database', 'payment') }}