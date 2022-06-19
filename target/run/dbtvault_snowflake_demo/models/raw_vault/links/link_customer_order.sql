

      create or replace transient table DV_PROTOTYPE_DB.dbt_tacharya.link_customer_order  as
      (-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."ORDER_CUSTOMER_PK", rr."CUSTOMER_PK", rr."ORDER_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."ORDER_CUSTOMER_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.dbt_tacharya.v_stg_orders AS rr
    WHERE rr."ORDER_CUSTOMER_PK" IS NOT NULL
    AND rr."CUSTOMER_PK" IS NOT NULL
    AND rr."ORDER_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."ORDER_CUSTOMER_PK", a."CUSTOMER_PK", a."ORDER_PK", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert
      );
    