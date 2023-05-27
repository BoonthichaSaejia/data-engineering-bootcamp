WITH late as (
  SELECT * 
  FROM {{ref('fct_movements')}}
  WHERE variation_status = 'LATE'
    AND date(actual_timestamp_utc) >= DATE(DATETIME_SUB(current_datetime(), INTERVAL 3 DAY)) 

)


SELECT 
    company_name
    , count(variation_status) as number_of_late
FROM late
GROUP BY company_name
ORDER BY number_of_late desc
LIMIT 1