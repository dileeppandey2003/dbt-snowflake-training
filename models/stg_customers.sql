{{ config(materialized='ephemeral') }}

SELECT
  customer_id,
  first_name,
  last_name,
  city
FROM {{ source('raw', 'customers') }}
