

        (
            select

                cast('DV_PROTOTYPE_DB.dbt_tacharya.bookings_1' as 
    varchar
) as _dbt_source_relation,
                

            from DV_PROTOTYPE_DB.dbt_tacharya.bookings_1
        )

        union all
        

        (
            select

                cast('DV_PROTOTYPE_DB.dbt_tacharya.bookings_2' as 
    varchar
) as _dbt_source_relation,
                

            from DV_PROTOTYPE_DB.dbt_tacharya.bookings_2
        )

        