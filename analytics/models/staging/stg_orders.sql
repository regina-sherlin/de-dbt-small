select 
    order_id,
    customer_id,
    status,
    amount
from {{ source('bronze','orders') }}