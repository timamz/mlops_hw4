with base as (
    select * from {{ ref("stg_transactions") }}
),

aggregated as (
    select
        merchant,
        count(*) as transaction_count,
        count(distinct customer_id) as unique_customers,
        sum(amount) as total_amount,
        avg(amount) as avg_amount,
        quantile(0.95)(amount) AS p95_amount, -- noqa: PRS,AL03
        sum(is_fraud) as fraud_count
    from base
    group by 1
),

scored as (
    select
        merchant,
        transaction_count,
        unique_customers,
        total_amount,
        avg_amount,
        p95_amount,
        fraud_count,
        {{ dbt_utils.safe_divide("fraud_count", "transaction_count") }} as fraud_rate
    from aggregated
)

select
    merchant,
    transaction_count,
    unique_customers,
    total_amount,
    avg_amount,
    p95_amount,
    fraud_count,
    fraud_rate,
    fraud_rate >= 0.05 as suspicious_merchant
from scored
