-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."SUPPLIER_PK", rr."SUPPLIERKEY", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."SUPPLIER_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_orders AS rr
    WHERE rr."SUPPLIER_PK" IS NOT NULL
    QUALIFY row_number = 1
),

row_rank_2 AS (
    SELECT rr."SUPPLIER_PK", rr."SUPPLIERKEY", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."SUPPLIER_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_inventory AS rr
    WHERE rr."SUPPLIER_PK" IS NOT NULL
    QUALIFY row_number = 1
),

stage_union AS (
    SELECT * FROM row_rank_1
    UNION ALL
    SELECT * FROM row_rank_2
),

row_rank_union AS (
    SELECT ru.*,
           ROW_NUMBER() OVER(
               PARTITION BY ru."SUPPLIER_PK"
               ORDER BY ru."LOAD_DATE", ru."RECORD_SOURCE" ASC
           ) AS row_rank_number
    FROM stage_union AS ru
    WHERE ru."SUPPLIER_PK" IS NOT NULL
    QUALIFY row_rank_number = 1
),

records_to_insert AS (
    SELECT a."SUPPLIER_PK", a."SUPPLIERKEY", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_union AS a
    LEFT JOIN DV_PROTOTYPE_DB.DEMO.hub_supplier AS d
    ON a."SUPPLIER_PK" = d."SUPPLIER_PK"
    WHERE d."SUPPLIER_PK" IS NULL
)

SELECT * FROM records_to_insert