select
    customer_id,
    {{ to_upper('first_name') }} as first_name,
    {{ to_upper('last_name') }}  as last_name,
    email,
    city,
    created_at
from {{ source('raw', 'customers') }}

