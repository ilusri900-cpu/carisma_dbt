{{ config(
    materialized='incremental',
    unique_key='account_id'
) }}

select
    c.account_id,
    i.ifrs_stage,
    i.ead_amt,
    i.ecl_amt,
    i.pd,
    i.lgd,
    i.reporting_date,
    i.last_updated_ts
from {{ ref('stg_common_account_summary') }} c
join {{ ref('stg_ifrs_account_summary') }} i
  on c.account_id = i.account_id

{% if is_incremental() %}
where i.last_updated_ts >
  (select max(last_updated_ts) from {{ this }})
{% endif %}
