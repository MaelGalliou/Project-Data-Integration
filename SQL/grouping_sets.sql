SELECT 
    vendor_id, 
    pickup_location_id, 
    dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY vendor_id, pickup_location_id, dropoff_location_id

UNION ALL

SELECT 
    NULL AS vendor_id, 
    NULL AS pickup_location_id, 
    NULL AS dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY tpep_pickup_datetime, tpep_dropoff_datetime

UNION ALL

SELECT 
    NULL AS vendor_id, 
    NULL AS pickup_location_id, 
    NULL AS dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY rate_code_id

UNION ALL

SELECT 
    NULL AS vendor_id, 
    NULL AS pickup_location_id, 
    NULL AS dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY passenger_count

UNION ALL

SELECT 
    NULL AS vendor_id, 
    NULL AS pickup_location_id, 
    NULL AS dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY trip_distance

UNION ALL

SELECT 
    NULL AS vendor_id, 
    pickup_location_id, 
    dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY pickup_location_id, dropoff_location_id;
