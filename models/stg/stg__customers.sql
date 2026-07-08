select
customer_id as id,
first_name,
last_name,
phone as phone_number,
email,
street,
city,
state,
zip_code
from {{ source('localBike', 'customers') }}