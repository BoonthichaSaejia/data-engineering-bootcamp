with
fct_movements as (

    select * from {{ ref('fct_movements') }}

)

select * from fct_movements
limit 1