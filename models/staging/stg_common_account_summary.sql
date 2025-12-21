{{ config(materialized='view') }}

select
  account_id,
  customer_id,
  product_code,
  balance_amt,
  interest_rate,
  as_of_date,
  last_updated_ts
from {{ source('oracle_banking','common_account_summary') }}
where account_status = 'ACTIVE'
