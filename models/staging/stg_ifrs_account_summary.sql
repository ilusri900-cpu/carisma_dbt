{{ config(materialized='view') }}

select
  account_id,
  ifrs_stage,
  ead_amt,
  ecl_amt,
  pd,
  lgd,
  reporting_date,
  last_updated_ts
from {{ source('oracle_banking','ifrs_account_summary') }}
