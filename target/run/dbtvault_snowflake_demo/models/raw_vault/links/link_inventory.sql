begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_inventory ("INVENTORY_PK", "SUPPLIER_PK", "PART_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "INVENTORY_PK", "SUPPLIER_PK", "PART_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_inventory__dbt_tmp
        );
    commit;