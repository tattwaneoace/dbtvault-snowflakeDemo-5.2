begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_customer_nation ("LINK_CUSTOMER_NATION_PK", "CUSTOMER_PK", "NATION_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "LINK_CUSTOMER_NATION_PK", "CUSTOMER_PK", "NATION_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_customer_nation__dbt_tmp
        );
    commit;