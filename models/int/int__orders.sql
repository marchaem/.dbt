with orders_grouped_by_order_items as (
    select 
    ord.order_id,
    sum(ord_it.list_price*ord_it.quantity*(1-ord_it.discount)) as total_CA
    from {{ ref('stg__orders') }} as ord
    left join {{ ref('stg__order_items') }}  as ord_it on ord.order_id=ord_it.order_id
    group by ord.order_id
),

 orders_grouped_by_staff as (
    select
    ord.order_id,
    staf.staff_id,
    staf.manager_id,
    staf.store_id
    from {{ ref('stg__orders') }} as ord
    left join {{ ref('stg__staffs') }} as staf on ord.staff_id=staf.staff_id
    where staffs.active=true
    group by ord.order_id
)


select
ord.order_id as order_id,
sum(ord2.total_CA) as total_CA
from orders_grouped_by_order_items as ord1
inner join orders_grouped_by_staff as ord2 on ord1.order_id=ord2.order_id
