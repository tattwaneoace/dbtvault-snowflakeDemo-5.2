with source as (

    select * from snowflake_sample_data.tpch_sf1.lineitem

),

renamed as (

    select
    
        CAST((MD5_BINARY(NULLIF(UPPER(TRIM(CAST(coalesce(cast(l_orderkey as 
        varchar
    ), '') || '-' || coalesce(cast(l_linenumber as 
        varchar
    ), '') AS VARCHAR))), ''))) AS BINARY(16)) AS 
                 order_item_key,
        l_orderkey as order_key,
        l_partkey as part_key,
        l_suppkey as supplier_key,
        l_linenumber as line_number,
        l_quantity as quantity,
        l_extendedprice as extended_price,
        l_discount as discount_percentage,
        l_tax as tax_rate,
        l_returnflag as return_flag,
        l_linestatus as status_code,
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date,
        l_shipinstruct as ship_instructions,
        l_shipmode as ship_mode,
        l_comment as comment

    from source

)

select * from renamed