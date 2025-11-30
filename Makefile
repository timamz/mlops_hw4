DBT_PROFILES_DIR ?= $(PWD)/dbt
DBT_PROJECT_DIR ?= $(PWD)/dbt
DBT := DBT_PROFILES_DIR=$(DBT_PROFILES_DIR) dbt --project-dir $(DBT_PROJECT_DIR)

.PHONY: deps seed run test docs lint format all

deps:
	$(DBT) deps

seed:
	$(DBT) seed

run:
	$(DBT) run

test:
	$(DBT) test

docs:
	$(DBT) docs generate

lint:
	sqlfluff lint $(DBT_PROJECT_DIR)/models

format:
	sqlfluff fix $(DBT_PROJECT_DIR)/models

all: deps seed run test
