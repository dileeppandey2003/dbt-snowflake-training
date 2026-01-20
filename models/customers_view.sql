SELECT
  customer_id,
  first_name,
  last_name,
  email,
  city,
  created_at
FROM {{ source('raw', 'customers') }}
