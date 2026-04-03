with source as (
    select * from {{ source('hevo_raw', 'raw_customers') }}
)

select
    id as customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name
from source