with base as (
    select * from {{ ref("stg_transactions") }}
),

aggregated as (
    select
        customer_id,
        any(name_1) as name_1,
        any(name_2) as name_2,
        any(gender) as gender,
        any(us_state) as home_state,
        count(*) as transaction_count,
        sum(is_fraud) as fraud_count,
        {{ dbt_utils.safe_divide("sum(is_fraud)", "count(*)") }} as fraud_rate,
        sum(amount) as total_amount,
        avg(amount) as avg_amount,
        quantile(0.95)(amount) AS p95_amount, -- noqa: PRS,AL03
        max(transaction_time) as last_transaction_time
    from base
    group by 1
),

scored as (
    select
        customer_id,
        name_1,
        name_2,
        gender,
        home_state,
        transaction_count,
        fraud_count,
        fraud_rate,
        total_amount,
        avg_amount,
        p95_amount,
        last_transaction_time,
        case
            when fraud_rate >= 0.1 then 'HIGH'
            when fraud_rate >= 0.03 then 'MEDIUM'
            else 'LOW'
        end as risk_level
    from aggregated
)

select * from scored
