
  create or replace  view DV_PROTOTYPE_DB.dbt_tacharya.stg_tpch_orders 
  
   as (
    with source as (

    select * from snowflake_sample_data.tpch_sf1.orders

),

renamed as (

    select

        o_orderkey as order_key,
        o_custkey as customer_key,
        o_orderstatus as status_code,
        o_totalprice as total_price,
        o_orderdate as order_date,
        o_orderpriority as priority_code,
        o_clerk as clerk_name,
        o_shippriority as ship_priority,
        o_comment as comment

    from source

)

select * from renamed
  );
