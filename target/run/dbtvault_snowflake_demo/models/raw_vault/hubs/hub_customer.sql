begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_customer ("CUSTOMER_PK", "CUSTOMERKEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "CUSTOMER_PK", "CUSTOMERKEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_customer__dbt_tmp
        );
    commit;