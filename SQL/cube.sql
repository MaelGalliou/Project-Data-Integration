SELECT 
    pickup_location_id, 
    dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY pickup_location_id, dropoff_location_id 

UNION ALL

SELECT 
    pickup_location_id, 
    NULL AS dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY pickup_location_id

UNION ALL

SELECT 
    NULL AS pickup_location_id, 
    dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY dropoff_location_id

UNION ALL

SELECT 
    NULL AS pickup_location_id, 
    NULL AS dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips;
