SELECT
staff_id,
CONCAT(first_name,'-',last_name) as full_name,
email,
phone,
active,
store_id,
manager_id
from {{ source('localBike', 'staffs') }}