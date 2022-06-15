begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.sat_inv_supp_region_details ("SUPPLIER_PK", "SUPPLIER_NATION_HASHDIFF", "SUPPLIER_NATION_NAME", "SUPPLIER_NATION_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "SUPPLIER_PK", "SUPPLIER_NATION_HASHDIFF", "SUPPLIER_NATION_NAME", "SUPPLIER_NATION_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.sat_inv_supp_region_details__dbt_tmp
        );
    commit;