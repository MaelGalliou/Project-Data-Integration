SELECT 
    pickup_location_id, 
    dropoff_location_id, 
    SUM(fare_amount) AS total_fare
FROM fact_trips
GROUP BY pickup_location_id, dropoff_location_id WITH ROLLUP;
