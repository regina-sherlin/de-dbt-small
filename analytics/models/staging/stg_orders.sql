{{  
  config(
		materialized='incremental',
		unique_key='order_id'
	)
}}

select 
    order_id,
    customer_id,
    {{ clean_text('status') }} as status,
    amount
from {{ source('bronze','orders') }}

{% if is_incremental() %}
where order_id > (select max(order_id) from {{ this }})
{% endif %}