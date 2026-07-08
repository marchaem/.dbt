SELECT  [user_name] as id,
			CAST([customer_zip_code] as CHAR) as zip_code,
			[customer_city],
			[customer_state],
			[row_num]
from {{ source('sales_database', 'user') }}