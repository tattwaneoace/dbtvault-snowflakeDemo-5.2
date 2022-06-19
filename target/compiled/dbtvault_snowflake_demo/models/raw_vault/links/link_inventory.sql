-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."INVENTORY_PK", rr."SUPPLIER_PK", rr."PART_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."INVENTORY_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.dbt_tacharya.v_stg_inventory AS rr
    WHERE rr."INVENTORY_PK" IS NOT NULL
    AND rr."SUPPLIER_PK" IS NOT NULL
    AND rr."PART_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."INVENTORY_PK", a."SUPPLIER_PK", a."PART_PK", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert