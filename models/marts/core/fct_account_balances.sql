{{ config(
    materialized='incremental',
    unique_key='account_id'
) }}

select *
from {{ ref('stg_common_account_summary') }}

{% if is_incremental() %}
where last_updated_ts >
  (select max(last_updated_ts) from {{ this }})
{% endif %}
