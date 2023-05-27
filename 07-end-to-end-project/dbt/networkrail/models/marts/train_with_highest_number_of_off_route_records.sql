WITH off_route as (
  SELECT * 
  FROM {{ref('fct_movements')}}
  WHERE variation_status = 'OFF ROUTE'
)


SELECT 
    train_id
    , count(variation_status) as number_of_offroute
FROM off_route
GROUP BY train_id 
ORDER BY number_of_offroute desc
LIMIT 1