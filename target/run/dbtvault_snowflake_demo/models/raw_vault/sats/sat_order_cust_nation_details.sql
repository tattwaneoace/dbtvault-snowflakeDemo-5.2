begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.sat_order_cust_nation_details ("CUSTOMER_PK", "CUSTOMER_NATION_HASHDIFF", "CUSTOMER_NATION_NAME", "CUSTOMER_NATION_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "CUSTOMER_PK", "CUSTOMER_NATION_HASHDIFF", "CUSTOMER_NATION_NAME", "CUSTOMER_NATION_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.sat_order_cust_nation_details__dbt_tmp
        );
    commit;