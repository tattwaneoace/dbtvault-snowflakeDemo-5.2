-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."ORDER_PK", rr."ORDERKEY", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."ORDER_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_orders AS rr
    WHERE rr."ORDER_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."ORDER_PK", a."ORDERKEY", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
    LEFT JOIN DV_PROTOTYPE_DB.DEMO.hub_order AS d
    ON a."ORDER_PK" = d."ORDER_PK"
    WHERE d."ORDER_PK" IS NULL
)

SELECT * FROM records_to_insert