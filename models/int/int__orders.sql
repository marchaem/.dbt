with orders_grouped_by_staff as (
    select
        ord.order_id as order_id,
        staf.staff_id as staff_id,
        staf.manager_id as manager_id,
        staf.store_id as store_id,
        sum(ord_it.list_price*ord_it.quantity*(1-ord_it.discount)) as total_CA
    from {{ ref('stg__orders') }} as ord
    left join {{ ref('stg__staffs') }} as staf on ord.staff_id=staf.staff_id
    left join {{ ref('stg__order_items') }} as ord_it on ord_it.order_id=ord.order_id
    where staf.active=1
    group by ord.order_id, staf.staff_id,staf.manager_id,staf.store_id
)

select
    ord.order_id as order_id,
    ord.total_CA as total_CA,
    ord.staff_id as staff_id,
    ord.manager_id as manager_id,
    ord.store_id as store_id
from orders_grouped_by_staff as ord
