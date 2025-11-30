with base as (
    select * from {{ ref("stg_transactions") }}
),

aggregated as (
    select
        transaction_date,
        us_state,
        count(*) as transaction_count,
        sum(amount) as total_amount,
        avg(amount) as avg_amount,
        quantile(0.95)(amount) AS p95_amount, -- noqa: PRS,AL03
        sum(case when amount >= 100 then 1 else 0 end) as large_txn_count
    from base
    group by 1, 2
)

select
    transaction_date,
    us_state,
    transaction_count,
    total_amount,
    avg_amount,
    p95_amount,
    {{ dbt_utils.safe_divide("large_txn_count", "transaction_count") }} as large_txn_share,
    100 as large_txn_threshold
from aggregated
