begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_customer_order ("ORDER_CUSTOMER_PK", "CUSTOMER_PK", "ORDER_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "ORDER_CUSTOMER_PK", "CUSTOMER_PK", "ORDER_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_customer_order__dbt_tmp
        );
    commit;