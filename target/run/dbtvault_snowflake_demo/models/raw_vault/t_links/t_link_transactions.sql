begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.t_link_transactions ("TRANSACTION_PK", "CUSTOMER_PK", "ORDER_PK", "TRANSACTION_NUMBER", "TRANSACTION_DATE", "TYPE", "AMOUNT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "TRANSACTION_PK", "CUSTOMER_PK", "ORDER_PK", "TRANSACTION_NUMBER", "TRANSACTION_DATE", "TYPE", "AMOUNT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.t_link_transactions__dbt_tmp
        );
    commit;