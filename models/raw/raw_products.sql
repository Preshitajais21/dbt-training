{{
    config(
        materialized='table'
    )
}}

select * from raw_new.globalmart.product