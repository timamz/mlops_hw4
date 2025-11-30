with source as (
    select * from {{ source("raw_transactions", "transactions") }}
),

typed as (
    select
        toDateTime(transaction_time) as transaction_time,
        merch as merchant,
        cat_id,
        toFloat64(amount) as amount,
        name_1,
        name_2,
        gender,
        street,
        one_city as city,
        us_state,
        post_code,
        toFloat64(lat) as lat,
        toFloat64(lon) as lon,
        toInt32(population_city) as population_city,
        jobs,
        toFloat64(merchant_lat) as merchant_lat,
        toFloat64(merchant_lon) as merchant_lon,
        toInt32(target) as is_fraud
    from source
),

enriched as (
    select
        {{ dbt_utils.generate_surrogate_key([
            "transaction_time",
            "merchant",
            "cat_id",
            "amount",
            "name_1",
            "name_2",
            "us_state"
        ]) }} as transaction_id,
        {{ dbt_utils.generate_surrogate_key([
            "name_1",
            "name_2",
            "street",
            "city",
            "us_state",
            "post_code"
        ]) }} as customer_id,
        *,
        toDate(transaction_time) as transaction_date,
        toStartOfHour(transaction_time) as transaction_hour,
        toHour(transaction_time) as hour_of_day,
        toDayOfWeek(transaction_time) as day_of_week,
        multiIf(
            toDayOfWeek(transaction_time) = 1, 'Monday',
            toDayOfWeek(transaction_time) = 2, 'Tuesday',
            toDayOfWeek(transaction_time) = 3, 'Wednesday',
            toDayOfWeek(transaction_time) = 4, 'Thursday',
            toDayOfWeek(transaction_time) = 5, 'Friday',
            toDayOfWeek(transaction_time) = 6, 'Saturday',
            toDayOfWeek(transaction_time) = 7, 'Sunday',
            'Unknown'
        ) as day_name,
        {{ amount_bucket("amount") }} as amount_bucket
    from typed
)

select * from enriched
