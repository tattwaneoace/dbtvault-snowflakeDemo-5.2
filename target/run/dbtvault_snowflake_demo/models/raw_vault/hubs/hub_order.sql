begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_order ("ORDER_PK", "ORDERKEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "ORDER_PK", "ORDERKEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_order__dbt_tmp
        );
    commit;