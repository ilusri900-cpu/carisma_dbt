{% snapshot account_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='account_id',
    strategy='timestamp',
    updated_at='last_updated_ts'
  )
}}

select * from {{ ref('stg_common_account_summary') }}

{% endsnapshot %}
