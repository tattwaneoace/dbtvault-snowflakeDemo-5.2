
  create or replace  view DV_PROTOTYPE_DB.dbt_tacharya.customer 
  
   as (
    SELECT ID 
    , FIRST_NAME
    , LAST_NAME
    , birthdate
FROM DV_PROTOTYPE_DB.dbt_tacharya.customers
  );
