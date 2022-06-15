
  create or replace  view DV_PROTOTYPE_DB.DEMO.customer
  
   as (
    SELECT ID 
    , FIRST_NAME
    , LAST_NAME
    , birthdate
FROM DV_PROTOTYPE_DB.DEMO.customers
  );
