begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_supplier_nation ("LINK_SUPPLIER_NATION_PK", "SUPPLIER_PK", "NATION_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "LINK_SUPPLIER_NATION_PK", "SUPPLIER_PK", "NATION_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_supplier_nation__dbt_tmp
        );
    commit;