# Hevo & Snowflake Data Transformation Project

## Overview
This project demonstrates a complete ELT pipeline. Raw data (Customers, Orders, and Payments) is replicated from a PostgreSQL source into Snowflake via **Hevo Data** using Logical Replication. This dbt project then transforms that raw data into a refined "Customer 360" Dimensional Mart.

## Project Architecture
1. **Extraction & Loading:** Hevo Data Pipeline (PostgreSQL -> Snowflake `CUSTOMERS` DB).
2. **Transformation:** dbt Cloud (Snowflake `CUSTOMERS` DB -> `DBT_DB` DB).
3. **Lineage:** Source Tables -> Staging Models -> Final Fact/Dim Marts.
4. **Security:** No database credentials or raw server URLs are hardcoded in this repository. All connections are managed securely via dbt environments and project variables.

## How to Build and Run
To execute the transformation pipeline and verify data integrity, run the following commands in the dbt CLI or dbt Cloud IDE:

### 1. Install Dependencies
Ensure all necessary dbt packages (if any) are installed:
```bash
dbt deps

This is the primary execution command. It will run all models in their correct dependency order and execute all attached data tests (Unique, Not Null) in one step:
dbt build

If you wish to run only the final Customer Mart:
dbt run --select dim_customers