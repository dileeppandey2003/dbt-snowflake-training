{% snapshot customers_scd2_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='created_at'
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

{% endsnapshot %}
