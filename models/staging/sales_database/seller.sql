SELECT  [seller_id],
			CAST([seller_zip_code] as CHAR),
			[seller_city],
			[seller_state]
FROM {{ source('sales_database', 'seller') }}