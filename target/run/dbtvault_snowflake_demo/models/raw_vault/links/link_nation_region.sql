begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_nation_region ("NATION_REGION_PK", "NATION_PK", "REGION_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "NATION_REGION_PK", "NATION_PK", "REGION_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_nation_region__dbt_tmp
        );
    commit;