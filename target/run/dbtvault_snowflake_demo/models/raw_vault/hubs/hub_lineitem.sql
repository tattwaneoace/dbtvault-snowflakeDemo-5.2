begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_lineitem ("LINEITEM_PK", "LINENUMBER", "ORDERKEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "LINEITEM_PK", "LINENUMBER", "ORDERKEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_lineitem__dbt_tmp
        );
    commit;