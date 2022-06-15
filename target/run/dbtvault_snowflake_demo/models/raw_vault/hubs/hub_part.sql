begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_part ("PART_PK", "PARTKEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "PART_PK", "PARTKEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_part__dbt_tmp
        );
    commit;