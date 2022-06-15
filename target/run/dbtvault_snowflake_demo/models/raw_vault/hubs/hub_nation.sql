begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_nation ("NATION_PK", "NATION_KEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "NATION_PK", "NATION_KEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_nation__dbt_tmp
        );
    commit;