WITH on_time as (
  SELECT * 
  FROM {{ref('fct_movements')}}
  WHERE variation_status = 'ON TIME'
    AND date(actual_timestamp_utc) >= DATE(DATETIME_SUB(current_datetime(), INTERVAL 3 DAY)) 

)


SELECT 
    company_name
    , count(variation_status) as number_of_on_time
FROM on_time
GROUP BY company_name
ORDER BY number_of_on_time desc
LIMIT 1