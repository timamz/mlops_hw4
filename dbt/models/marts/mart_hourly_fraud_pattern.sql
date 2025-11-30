with base as (
    select * from {{ ref("stg_transactions") }}
),

aggregated as (
    select
        day_of_week,
        day_name,
        hour_of_day,
        count(*) as transaction_count,
        sum(is_fraud) as fraud_count,
        sum(amount) as total_amount,
        avg(amount) as avg_amount
    from base
    group by day_of_week, day_name, hour_of_day
)

select
    day_of_week,
    day_name,
    hour_of_day,
    transaction_count,
    fraud_count,
    total_amount,
    avg_amount,
    {{ dbt_utils.safe_divide("fraud_count", "transaction_count") }} as fraud_rate
from aggregated
order by day_of_week, hour_of_day
