-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."LINK_CUSTOMER_NATION_PK", rr."CUSTOMER_PK", rr."NATION_PK", rr."LOAD_DATE", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."LINK_CUSTOMER_NATION_PK"
               ORDER BY rr."LOAD_DATE"
           ) AS row_number
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_orders AS rr
    WHERE rr."LINK_CUSTOMER_NATION_PK" IS NOT NULL
    AND rr."CUSTOMER_PK" IS NOT NULL
    AND rr."NATION_PK" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."LINK_CUSTOMER_NATION_PK", a."CUSTOMER_PK", a."NATION_PK", a."LOAD_DATE", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
    LEFT JOIN DV_PROTOTYPE_DB.DEMO.link_customer_nation AS d
    ON a."LINK_CUSTOMER_NATION_PK" = d."LINK_CUSTOMER_NATION_PK"
    WHERE d."LINK_CUSTOMER_NATION_PK" IS NULL
)

SELECT * FROM records_to_insert