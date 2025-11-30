## Версии `dbt-core` и `dbt-clickhouse`

dbt-core==1.8.7
dbt-clickhouse==1.8.7

## Скриншот/лог успешного `dbt test`

`dbt test --project-dir dbt --profiles-dir dbt` завершился успешно:
- PASS=44, WARN=0, ERROR=0, SKIP=0.
- Адаптер: clickhouse 1.8.7.

## Скриншот DAG из dbt Docs

## Версии `dbt-core` и `dbt-clickhouse`

dbt-core==1.8.7
dbt-clickhouse==1.8.7

## Скриншот/лог успешного `dbt test`

```
[0m19:35:38  Running with dbt=1.8.7
[0m19:35:38  Registered adapter: clickhouse=1.8.7
[0m19:35:39  Found 1 seed, 7 models, 43 data tests, 1 source, 852 macros, 1 unit test
[0m19:35:39  
[0m19:35:39  Concurrency: 4 threads (target='dev')
[0m19:35:39  
[0m19:35:39  1 of 44 START test accepted_values_mart_customer_risk_profile_risk_level__HIGH__MEDIUM__LOW  [RUN]
[0m19:35:39  2 of 44 START test accepted_values_stg_transactions_amount_bucket__small__medium__large__very_large  [RUN]
[0m19:35:39  3 of 44 START test accepted_values_stg_transactions_gender__M__F ............... [RUN]
[0m19:35:39  4 of 44 START test accepted_values_stg_transactions_is_fraud__0__1 ............. [RUN]
[0m19:35:39  1 of 44 PASS accepted_values_mart_customer_risk_profile_risk_level__HIGH__MEDIUM__LOW  [[32mPASS[0m in 0.05s]
[0m19:35:39  5 of 44 START test assert_fraud_rate_bounds .................................... [RUN]
[0m19:35:39  3 of 44 PASS accepted_values_stg_transactions_gender__M__F ..................... [[32mPASS[0m in 0.06s]
[0m19:35:39  2 of 44 PASS accepted_values_stg_transactions_amount_bucket__small__medium__large__very_large  [[32mPASS[0m in 0.06s]
[0m19:35:39  6 of 44 START test assert_no_negative_amounts .................................. [RUN]
[0m19:35:39  7 of 44 START test dbt_expectations_expect_column_values_to_be_between_mart_customer_risk_profile_fraud_rate__1__0  [RUN]
[0m19:35:39  5 of 44 PASS assert_fraud_rate_bounds .......................................... [[32mPASS[0m in 0.06s]
[0m19:35:39  8 of 44 START test dbt_expectations_expect_column_values_to_be_between_mart_daily_state_metrics_large_txn_share__1__0  [RUN]
[0m19:35:39  7 of 44 PASS dbt_expectations_expect_column_values_to_be_between_mart_customer_risk_profile_fraud_rate__1__0  [[32mPASS[0m in 0.03s]
[0m19:35:39  6 of 44 PASS assert_no_negative_amounts ........................................ [[32mPASS[0m in 0.03s]
[0m19:35:39  9 of 44 START test dbt_expectations_expect_column_values_to_be_between_mart_fraud_by_category_fraud_rate__1__0  [RUN]
[0m19:35:39  10 of 44 START test dbt_expectations_expect_column_values_to_be_between_mart_fraud_by_state_fraud_rate__1__0  [RUN]
[0m19:35:39  8 of 44 PASS dbt_expectations_expect_column_values_to_be_between_mart_daily_state_metrics_large_txn_share__1__0  [[32mPASS[0m in 0.02s]
[0m19:35:39  11 of 44 START test dbt_expectations_expect_column_values_to_be_between_mart_hourly_fraud_pattern_fraud_rate__1__0  [RUN]
[0m19:35:39  9 of 44 PASS dbt_expectations_expect_column_values_to_be_between_mart_fraud_by_category_fraud_rate__1__0  [[32mPASS[0m in 0.02s]
[0m19:35:39  10 of 44 PASS dbt_expectations_expect_column_values_to_be_between_mart_fraud_by_state_fraud_rate__1__0  [[32mPASS[0m in 0.02s]
[0m19:35:39  12 of 44 START test dbt_expectations_expect_column_values_to_be_between_mart_merchant_analytics_fraud_rate__1__0  [RUN]
[0m19:35:39  13 of 44 START test dbt_expectations_expect_column_values_to_be_between_stg_transactions_amount__0  [RUN]
[0m19:35:39  4 of 44 PASS accepted_values_stg_transactions_is_fraud__0__1 ................... [[32mPASS[0m in 0.15s]
[0m19:35:39  11 of 44 PASS dbt_expectations_expect_column_values_to_be_between_mart_hourly_fraud_pattern_fraud_rate__1__0  [[32mPASS[0m in 0.02s]
[0m19:35:39  14 of 44 START test dbt_expectations_source_expect_column_values_to_be_between_raw_transactions_transactions_amount__0  [RUN]
[0m19:35:39  15 of 44 START test dbt_utils_unique_combination_of_columns_mart_daily_state_metrics_transaction_date__us_state  [RUN]
[0m19:35:39  12 of 44 PASS dbt_expectations_expect_column_values_to_be_between_mart_merchant_analytics_fraud_rate__1__0  [[32mPASS[0m in 0.02s]
[0m19:35:39  16 of 44 START test dbt_utils_unique_combination_of_columns_mart_hourly_fraud_pattern_day_of_week__hour_of_day  [RUN]
[0m19:35:39  13 of 44 PASS dbt_expectations_expect_column_values_to_be_between_stg_transactions_amount__0  [[32mPASS[0m in 0.03s]
[0m19:35:39  17 of 44 START test dbt_utils_unique_combination_of_columns_stg_transactions_transaction_id  [RUN]
[0m19:35:39  14 of 44 PASS dbt_expectations_source_expect_column_values_to_be_between_raw_transactions_transactions_amount__0  [[32mPASS[0m in 0.02s]
[0m19:35:39  15 of 44 PASS dbt_utils_unique_combination_of_columns_mart_daily_state_metrics_transaction_date__us_state  [[32mPASS[0m in 0.02s]
[0m19:35:39  18 of 44 START test not_null_mart_customer_risk_profile_customer_id ............ [RUN]
[0m19:35:39  19 of 44 START test not_null_mart_daily_state_metrics_transaction_date ......... [RUN]
[0m19:35:39  16 of 44 PASS dbt_utils_unique_combination_of_columns_mart_hourly_fraud_pattern_day_of_week__hour_of_day  [[32mPASS[0m in 0.02s]
[0m19:35:39  20 of 44 START test not_null_mart_daily_state_metrics_us_state ................. [RUN]
[0m19:35:39  19 of 44 PASS not_null_mart_daily_state_metrics_transaction_date ............... [[32mPASS[0m in 0.02s]
[0m19:35:39  18 of 44 PASS not_null_mart_customer_risk_profile_customer_id .................. [[32mPASS[0m in 0.02s]
[0m19:35:39  21 of 44 START test not_null_mart_fraud_by_category_cat_id ..................... [RUN]
[0m19:35:39  22 of 44 START test not_null_mart_fraud_by_state_us_state ...................... [RUN]
[0m19:35:39  20 of 44 PASS not_null_mart_daily_state_metrics_us_state ....................... [[32mPASS[0m in 0.01s]
[0m19:35:39  23 of 44 START test not_null_mart_merchant_analytics_merchant .................. [RUN]
[0m19:35:39  21 of 44 PASS not_null_mart_fraud_by_category_cat_id ........................... [[32mPASS[0m in 0.02s]
[0m19:35:39  22 of 44 PASS not_null_mart_fraud_by_state_us_state ............................ [[32mPASS[0m in 0.02s]
[0m19:35:39  24 of 44 START test not_null_stg_transactions_amount ........................... [RUN]
[0m19:35:39  23 of 44 PASS not_null_mart_merchant_analytics_merchant ........................ [[32mPASS[0m in 0.02s]
[0m19:35:39  25 of 44 START test not_null_stg_transactions_cat_id ........................... [RUN]
[0m19:35:39  26 of 44 START test not_null_stg_transactions_customer_id ...................... [RUN]
[0m19:35:39  17 of 44 PASS dbt_utils_unique_combination_of_columns_stg_transactions_transaction_id  [[32mPASS[0m in 0.06s]
[0m19:35:39  27 of 44 START test not_null_stg_transactions_merchant ......................... [RUN]
[0m19:35:39  24 of 44 PASS not_null_stg_transactions_amount ................................. [[32mPASS[0m in 0.02s]
[0m19:35:39  26 of 44 PASS not_null_stg_transactions_customer_id ............................ [[32mPASS[0m in 0.02s]
[0m19:35:39  28 of 44 START test not_null_stg_transactions_transaction_date ................. [RUN]
[0m19:35:39  29 of 44 START test not_null_stg_transactions_transaction_id ................... [RUN]
[0m19:35:39  25 of 44 PASS not_null_stg_transactions_cat_id ................................. [[32mPASS[0m in 0.02s]
[0m19:35:39  30 of 44 START test not_null_stg_transactions_transaction_time ................. [RUN]
[0m19:35:39  27 of 44 PASS not_null_stg_transactions_merchant ............................... [[32mPASS[0m in 0.02s]
[0m19:35:39  31 of 44 START test not_null_stg_transactions_us_state ......................... [RUN]
[0m19:35:39  28 of 44 PASS not_null_stg_transactions_transaction_date ....................... [[32mPASS[0m in 0.02s]
[0m19:35:39  32 of 44 START test source_accepted_values_raw_transactions_transactions_gender__M__F  [RUN]
[0m19:35:39  29 of 44 PASS not_null_stg_transactions_transaction_id ......................... [[32mPASS[0m in 0.02s]
[0m19:35:39  30 of 44 PASS not_null_stg_transactions_transaction_time ....................... [[32mPASS[0m in 0.02s]
[0m19:35:39  33 of 44 START test source_accepted_values_raw_transactions_transactions_target__0__1  [RUN]
[0m19:35:39  31 of 44 PASS not_null_stg_transactions_us_state ............................... [[32mPASS[0m in 0.01s]
[0m19:35:39  34 of 44 START test source_not_null_raw_transactions_transactions_amount ....... [RUN]
[0m19:35:39  35 of 44 START test source_not_null_raw_transactions_transactions_cat_id ....... [RUN]
[0m19:35:39  32 of 44 PASS source_accepted_values_raw_transactions_transactions_gender__M__F  [[32mPASS[0m in 0.02s]
[0m19:35:39  36 of 44 START test source_not_null_raw_transactions_transactions_merch ........ [RUN]
[0m19:35:39  33 of 44 PASS source_accepted_values_raw_transactions_transactions_target__0__1  [[32mPASS[0m in 0.02s]
[0m19:35:39  34 of 44 PASS source_not_null_raw_transactions_transactions_amount ............. [[32mPASS[0m in 0.02s]
[0m19:35:39  35 of 44 PASS source_not_null_raw_transactions_transactions_cat_id ............. [[32mPASS[0m in 0.02s]
[0m19:35:39  37 of 44 START test source_not_null_raw_transactions_transactions_transaction_time  [RUN]
[0m19:35:39  38 of 44 START test source_not_null_raw_transactions_transactions_us_state ..... [RUN]
[0m19:35:39  39 of 44 START test unique_mart_customer_risk_profile_customer_id .............. [RUN]
[0m19:35:39  36 of 44 PASS source_not_null_raw_transactions_transactions_merch .............. [[32mPASS[0m in 0.02s]
[0m19:35:39  40 of 44 START test unique_mart_fraud_by_category_cat_id ....................... [RUN]
[0m19:35:39  37 of 44 PASS source_not_null_raw_transactions_transactions_transaction_time ... [[32mPASS[0m in 0.02s]
[0m19:35:39  38 of 44 PASS source_not_null_raw_transactions_transactions_us_state ........... [[32mPASS[0m in 0.02s]
[0m19:35:39  39 of 44 PASS unique_mart_customer_risk_profile_customer_id .................... [[32mPASS[0m in 0.02s]
[0m19:35:39  41 of 44 START test unique_mart_fraud_by_state_us_state ........................ [RUN]
[0m19:35:39  42 of 44 START test unique_mart_merchant_analytics_merchant .................... [RUN]
[0m19:35:39  43 of 44 START test unique_stg_transactions_transaction_id ..................... [RUN]
[0m19:35:39  40 of 44 PASS unique_mart_fraud_by_category_cat_id ............................. [[32mPASS[0m in 0.02s]
[0m19:35:39  44 of 44 START unit_test stg_transactions::stg_transactions_bucketing .......... [RUN]
[0m19:35:39  41 of 44 PASS unique_mart_fraud_by_state_us_state .............................. [[32mPASS[0m in 0.03s]
[0m19:35:39  42 of 44 PASS unique_mart_merchant_analytics_merchant .......................... [[32mPASS[0m in 0.04s]
[0m19:35:39  43 of 44 PASS unique_stg_transactions_transaction_id ........................... [[32mPASS[0m in 0.07s]
[0m19:35:39  44 of 44 PASS stg_transactions::stg_transactions_bucketing ..................... [[32mPASS[0m in 0.15s]
[0m19:35:39  
[0m19:35:39  Finished running 43 data tests, 1 unit test in 0 hours 0 minutes and 0.59 seconds (0.59s).
[0m19:35:39  
[0m19:35:39  [32mCompleted successfully[0m
[0m19:35:39  
[0m19:35:39  Done. PASS=44 WARN=0 ERROR=0 SKIP=0 TOTAL=44
```

## Список реализованных витрин и тестов

- Витрины (marts): `mart_daily_state_metrics`, `mart_fraud_by_category`, `mart_fraud_by_state`, `mart_customer_risk_profile`, `mart_hourly_fraud_pattern`, `mart_merchant_analytics`.
- Staging: `stg_transactions` (нормализация, суррогатные ключи, bucketing сумм через макрос `amount_bucket`).
- Тесты:
  - Базовые: `not_null`, `unique`, `accepted_values` на ключевых колонках staging и витрин.
  - `dbt_expectations`: границы для `amount` (source/staging), `fraud_rate` (витрины), `large_txn_share` (витрина по штатам), `fraud_rate` (мерчанты/часы).
  - Singular (папка `dbt/tests/`): `assert_no_negative_amounts.sql`, `assert_fraud_rate_bounds.sql`.
  - Unit test (dbt 1.8+): `stg_transactions_bucketing` (`dbt/models/unit_tests/stg_transactions_unit.yml`).

## Для 10 баллов: конфиг sqlfluff и pre-commit

- `.sqlfluff` с диалектом clickhouse и templater dbt.
- `.pre-commit-config.yaml` с хуками `sqlfluff-lint` и `sqlfluff-fix`.
- `Makefile` с целями `deps`, `seed`, `run`, `test`, `docs`, `lint`, `format`, `all`.
