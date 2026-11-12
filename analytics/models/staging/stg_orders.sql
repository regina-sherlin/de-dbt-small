select 
    order_id,
    customer_id,
    upper(status) as status,
    amount
from {{ source('bronze','orders') }}