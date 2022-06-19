

      create or replace transient table DV_PROTOTYPE_DB.dbt_tacharya.sat_inv_supp_region_details  as
      (-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."SUPPLIER_PK", a."SUPPLIER_NATION_HASHDIFF", a."SUPPLIER_NATION_NAME", a."SUPPLIER_NATION_COMMENT", a.EFFECTIVE_FROM, a."LOAD_DATE", a."RECORD_SOURCE"
    FROM DV_PROTOTYPE_DB.dbt_tacharya.v_stg_inventory AS a
    WHERE a."SUPPLIER_PK" IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage."SUPPLIER_PK", stage."SUPPLIER_NATION_HASHDIFF", stage."SUPPLIER_NATION_NAME", stage."SUPPLIER_NATION_COMMENT", stage.EFFECTIVE_FROM, stage."LOAD_DATE", stage."RECORD_SOURCE"
    FROM source_data AS stage
)

SELECT * FROM records_to_insert
      );
    