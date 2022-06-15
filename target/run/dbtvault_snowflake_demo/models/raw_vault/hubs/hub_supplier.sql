begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.hub_supplier ("SUPPLIER_PK", "SUPPLIERKEY", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "SUPPLIER_PK", "SUPPLIERKEY", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.hub_supplier__dbt_tmp
        );
    commit;