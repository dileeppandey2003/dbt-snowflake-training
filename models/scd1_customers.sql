{{
  config(
    materialized='incremental',
    unique_key='customer_id',
    on_schema_change='sync_all_columns'
  )
}}

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    city,
    created_at
FROM {{ source('raw', 'customers') }}

{% if is_incremental() %}
WHERE created_at >= (
    SELECT COALESCE(MAX(created_at), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
