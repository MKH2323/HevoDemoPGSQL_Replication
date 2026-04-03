with source as (
    select * from {{ source('hevo_raw', 'raw_payments') }}
)
select
    id as payment_id,
    order_id,
    payment_method,
    amount
from source