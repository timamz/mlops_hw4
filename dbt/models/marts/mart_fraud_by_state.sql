with base as (
    select * from {{ ref("stg_transactions") }}
),

aggregated as (
    select
        us_state,
        count(*) as transaction_count,
        count(distinct customer_id) as unique_customers,
        count(distinct merchant) as unique_merchants,
        sum(amount) as total_amount,
        sum(case when is_fraud = 1 then amount else 0 end) as fraud_amount,
        sum(is_fraud) as fraud_count
    from base
    group by 1
)

select
    us_state,
    transaction_count,
    unique_customers,
    unique_merchants,
    total_amount,
    fraud_amount,
    fraud_count,
    {{ dbt_utils.safe_divide("fraud_count", "transaction_count") }} as fraud_rate
from aggregated
