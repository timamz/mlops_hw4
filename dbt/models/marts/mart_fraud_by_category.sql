with base as (
    select * from {{ ref("stg_transactions") }}
),

aggregated as (
    select
        cat_id,
        count(*) as transaction_count,
        sum(is_fraud) as fraud_count,
        sum(amount) as total_amount,
        sum(case when is_fraud = 1 then amount else 0 end) as fraud_amount,
        avg(amount) as avg_amount
    from base
    group by 1
)

select
    cat_id,
    transaction_count,
    fraud_count,
    total_amount,
    fraud_amount,
    avg_amount,
    {{ dbt_utils.safe_divide("fraud_count", "transaction_count") }} as fraud_rate
from aggregated
