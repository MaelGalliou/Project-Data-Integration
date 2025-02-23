CREATE TABLE fact_trips (
    trip_id SERIAL PRIMARY KEY,
    vendor_id INT REFERENCES dim_vendor(vendor_id),
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    passenger_count INT,
    trip_distance DECIMAL(10,2),
    rate_code_id INT,
    pickup_location_id INT REFERENCES dim_location(location_id),
    dropoff_location_id INT REFERENCES dim_location(location_id),
    payment_type_id INT REFERENCES dim_payment(payment_type_id),
    fare_amount DECIMAL(10,2),
    extra DECIMAL(10,2),
    mta_tax DECIMAL(10,2),
    tip_amount DECIMAL(10,2),
    tolls_amount DECIMAL(10,2),
    improvement_surcharge DECIMAL(10,2),
    congestion_surcharge DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

CREATE TABLE dim_vendor (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(100)
);

CREATE TABLE dim_location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(255)  -- Optional: Add a city/area name
);

CREATE TABLE dim_payment (
    payment_type_id INT PRIMARY KEY,
    payment_type_desc VARCHAR(50)
);

CREATE TABLE dim_time (
    time_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP,
    year INT,
    month INT,
    day INT,
    hour INT,
    minute INT,
    weekday VARCHAR(10)
);
