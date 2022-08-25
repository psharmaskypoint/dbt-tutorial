
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with Customer as (

    select  CustomerID customerid , lower(Firstname) firstname, upper(Lastname) lastname 
	from {{source('FivetranWithSkyPoint')}}

)

select *
from Customer

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
