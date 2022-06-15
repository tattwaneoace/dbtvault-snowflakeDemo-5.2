begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_region ("REGION_PK", "REGION_KEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "REGION_PK", "REGION_KEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_region__dbt_tmp
        );
    commit;