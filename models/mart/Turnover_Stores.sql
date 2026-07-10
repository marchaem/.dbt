select
staffs.manager_id as manager_id,
staffs.staff_id as staff_id,
stores.store_id as store_id,
orders.CA_tot as CA,
from {{ ref('int__orders') }} as orders
inner join {{ ref('stg__staffs') }} as staffs on orders.staff_id=staffs.staff_id
inner join {{ ref('stg__stores') }} as stores on orders.store_id=stores.store_id
