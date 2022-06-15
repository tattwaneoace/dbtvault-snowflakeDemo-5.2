-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."NATION_REGION_PK", rr."NATION_PK", rr."REGION_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."NATION_REGION_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_orders AS rr
    QUALIFY row_number = 1
),

row_rank_2 AS (
    SELECT rr."NATION_REGION_PK", rr."NATION_PK", rr."REGION_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."NATION_REGION_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_inventory AS rr
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
               PARTITION BY ru."NATION_REGION_PK"
               ORDER BY ru."LOAD_DATE", ru."RECORD_SOURCE" ASC
           ) AS row_rank_number
    FROM stage_union AS ru
    WHERE ru."NATION_REGION_PK" IS NOT NULL
    AND ru."NATION_PK" IS NOT NULL
    AND ru."REGION_PK" IS NOT NULL
    QUALIFY row_rank_number = 1
),

records_to_insert AS (
    SELECT a."NATION_REGION_PK", a."NATION_PK", a."REGION_PK", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_union AS a
    LEFT JOIN DV_PROTOTYPE_DB.DEMO.link_nation_region AS d
    ON a."NATION_REGION_PK" = d."NATION_REGION_PK"
    WHERE d."NATION_REGION_PK" IS NULL
)

SELECT * FROM records_to_insert