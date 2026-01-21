{{ config(
    pre_hook = "
        insert into dbt_db.analytics.model_audit_log
        (model_name, run_status, start_time)
        values
        ('customers_view', 'STARTED', current_timestamp)
    ",
    post_hook = "
        update dbt_db.analytics.model_audit_log
        set run_status = 'COMPLETED',
            end_time = current_timestamp
        where model_name = 'customers_view'
          and run_status = 'STARTED'
    "
) }}

select
    customer_id,
    first_name,
    last_name,
    email,
    city,
    created_at
from {{ source('raw', 'customers') }}

