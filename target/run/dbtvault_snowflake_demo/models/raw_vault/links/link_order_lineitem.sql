begin;
    

        insert into DV_PROTOTYPE_DB.DEMO.link_order_lineitem ("LINK_LINEITEM_ORDER_PK", "ORDER_PK", "LINEITEM_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "LINK_LINEITEM_ORDER_PK", "ORDER_PK", "LINEITEM_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DV_PROTOTYPE_DB.DEMO.link_order_lineitem__dbt_tmp
        );
    commit;