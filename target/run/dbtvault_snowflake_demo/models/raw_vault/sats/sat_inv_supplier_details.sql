begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.sat_inv_supplier_details ("SUPPLIER_PK", "SUPPLIER_HASHDIFF", "SUPPLIER_ADDRESS", "SUPPLIER_PHONE", "SUPPLIER_ACCTBAL", "SUPPLIER_NAME", "SUPPLIER_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "SUPPLIER_PK", "SUPPLIER_HASHDIFF", "SUPPLIER_ADDRESS", "SUPPLIER_PHONE", "SUPPLIER_ACCTBAL", "SUPPLIER_NAME", "SUPPLIER_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.sat_inv_supplier_details__dbt_tmp
        );
    commit;