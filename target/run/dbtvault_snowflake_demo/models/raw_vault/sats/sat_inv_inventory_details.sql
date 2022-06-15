begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.sat_inv_inventory_details ("INVENTORY_PK", "INVENTORY_HASHDIFF", "AVAILQTY", "SUPPLYCOST", "PART_SUPPLY_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "INVENTORY_PK", "INVENTORY_HASHDIFF", "AVAILQTY", "SUPPLYCOST", "PART_SUPPLY_COMMENT", "EFFECTIVE_FROM", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.sat_inv_inventory_details__dbt_tmp
        );
    commit;