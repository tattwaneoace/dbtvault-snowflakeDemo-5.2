-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."SUPPLIER_PK", a."SUPPLIER_HASHDIFF", a."SUPPLIER_ADDRESS", a."SUPPLIER_PHONE", a."SUPPLIER_ACCTBAL", a."SUPPLIER_NAME", a."SUPPLIER_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM DV_PROTOTYPE_DB.DEMO.v_stg_inventory AS a
    WHERE a."SUPPLIER_PK" IS NOT NULL
),

latest_records AS (
    SELECT a."SUPPLIER_PK", a."SUPPLIER_HASHDIFF", a."LOAD_DATE"
    FROM (
        SELECT current_records."SUPPLIER_PK", current_records."SUPPLIER_HASHDIFF", current_records."LOAD_DATE",
            RANK() OVER (
                PARTITION BY current_records."SUPPLIER_PK"
                ORDER BY current_records."LOAD_DATE" DESC
            ) AS rank
        FROM DV_PROTOTYPE_DB.DEMO.sat_inv_supplier_details AS current_records
            JOIN (
                SELECT DISTINCT source_data."SUPPLIER_PK"
                FROM source_data
            ) AS source_records
                ON current_records."SUPPLIER_PK" = source_records."SUPPLIER_PK"
    ) AS a
    WHERE a.rank = 1
),

records_to_insert AS (
    SELECT DISTINCT stage."SUPPLIER_PK", stage."SUPPLIER_HASHDIFF", stage."SUPPLIER_ADDRESS", stage."SUPPLIER_PHONE", stage."SUPPLIER_ACCTBAL", stage."SUPPLIER_NAME", stage."SUPPLIER_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
        LEFT JOIN latest_records
            ON latest_records."SUPPLIER_PK" = stage."SUPPLIER_PK"
            WHERE latest_records."SUPPLIER_HASHDIFF" != stage."SUPPLIER_HASHDIFF"
                OR latest_records."SUPPLIER_HASHDIFF" IS NULL
)

SELECT * FROM records_to_insert