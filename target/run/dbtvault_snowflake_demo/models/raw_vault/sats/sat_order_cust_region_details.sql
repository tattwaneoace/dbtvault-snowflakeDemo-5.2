begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.sat_order_cust_region_details ("CUSTOMER_PK", "CUSTOMER_REGION_HASHDIFF", "CUSTOMER_REGION_NAME", "CUSTOMER_REGION_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "CUSTOMER_PK", "CUSTOMER_REGION_HASHDIFF", "CUSTOMER_REGION_NAME", "CUSTOMER_REGION_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.sat_order_cust_region_details__dbt_tmp
        );
    commit;