begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_inventory_allocation ("INVENTORY_ALLOCATION_PK", "PART_PK", "SUPPLIER_PK", "LINEITEM_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "INVENTORY_ALLOCATION_PK", "PART_PK", "SUPPLIER_PK", "LINEITEM_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_inventory_allocation__dbt_tmp
        );
    commit;