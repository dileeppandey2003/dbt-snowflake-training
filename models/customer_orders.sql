SELECT
  o.order_id,
  o.customer_id,
  c.first_name,
  c.last_name,
  c.city,
  o.order_amount,
  o.order_status,
  o.order_date
FROM {{ source('raw', 'orders') }} o
JOIN {{ ref('stg_customers') }} c
  ON o.customer_id = c.customer_id
