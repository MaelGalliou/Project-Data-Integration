////////////////// Import Nodes //////////////////

// 1️⃣ Import Vendors
CREATE INDEX vendor_id_index FOR (v:Vendor) ON (v.vendor_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/vendor.csv' AS row
MERGE (v:Vendor {vendor_id: row.vendor_id});


// 2️⃣ Import Trips
CREATE INDEX trip_id_index FOR (t:Trip) ON (t.trip_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/trip.csv' AS row
MERGE (t:Trip {trip_id: row.trip_id})
SET t.tpep_pickup_datetime = row.tpep_pickup_datetime,
    t.tpep_dropoff_datetime = row.tpep_dropoff_datetime,
    t.trip_distance = toFloat(row.trip_distance),
    t.RatecodeID = row.RatecodeID,
    t.store_and_fwd_flag = row.store_and_fwd_flag;


// 3️⃣ Import Passenger Groups
CREATE INDEX passenger_count_id_index FOR (p:PassengerGroup) ON (p.passenger_count_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/passenger_group.csv' AS row
MERGE (p:PassengerGroup {passenger_count_id: row.passenger_count_id})
SET p.passenger_count = toInteger(row.passenger_count);

// 4️⃣ Import Locations
CREATE INDEX location_id_index FOR (l:Location) ON (l.location_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/location.csv' AS row
MERGE (l:Location {location_id: row.location_id});


// 5️⃣ Import Payment Types
CREATE INDEX payment_type_id_index FOR (p:PaymentType) ON (p.payment_type_id);

LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Nodes/payement_type.csv' AS row
MERGE (p:PaymentType {payment_type_id: row.payment_type_id})
SET p.payment_type_description = row.payment_type_description;






////////////////// Import Relations //////////////////

// 1️⃣ Relation between Trip and Vendor
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/trip-vendor.csv' AS row
MATCH (t:Trip {trip_id: row.trip_id}), (v:Vendor {vendor_id: row.vendor_id})
MERGE (v)-[:PROVIDED]->(t);


// 2️⃣ Relation between Trip and Passenger Group
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/trip-passenger_group.csv' AS row
MATCH (t:Trip {trip_id: row.trip_id}), (p:PassengerGroup {passenger_count_id: row.passenger_count_id})
MERGE (t)-[:HAS_PASSENGERS]->(p);


// 3️⃣ Relation between Trip and Start Location
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/trip-location_start.csv' AS row
MATCH (t:Trip {trip_id: row.trip_id}), (l:Location {location_id: row.location_id})
MERGE (t)-[:STARTED_AT]->(l);


// 4️⃣ Relation between Trip and End Location
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/trip-location_end.csv' AS row
MATCH (t:Trip {trip_id: row.trip_id}), (l:Location {location_id: row.location_id})
MERGE (t)-[:ENDED_AT]->(l);


// 5️⃣ Relation between Trip and Payment Type with cost details
LOAD CSV WITH HEADERS FROM 'file:///df_for_Neo4j/Relations/trip-payement.csv' AS row
MATCH (t:Trip {trip_id: row.trip_id}), (p:PaymentType {payment_type_id: row.payment_type_id})
MERGE (t)-[:PAID_FOR {
    fare_amount: toFloat(row.fare_amount),
    extra: toFloat(row.extra),
    mta_tax: toFloat(row.mta_tax),
    tip_amount: toFloat(row.tip_amount),
    tolls_amount: toFloat(row.tolls_amount),
    improvement_surcharge: toFloat(row.improvement_surcharge),
    congestion_surcharge: toFloat(row.congestion_surcharge),
    total_amount: toFloat(row.total_amount)
}]->(p);





////////////////// View Relations //////////////////

// 1️⃣ Average and Maximum Trip Distance
MATCH (t:Trip)
RETURN AVG(t.trip_distance) AS average_distance, 
       MAX(t.trip_distance) AS max_distance;


// 2️⃣ Number of Trips per Vendor
MATCH (v:Vendor)-[:PROVIDED]->(t:Trip)
RETURN v.vendor_id, COUNT(t) AS trip_count
ORDER BY trip_count DESC;


// 3️⃣ Top 5 Most Frequent Trip Routes
MATCH (t:Trip)-[:STARTED_AT]->(start:Location), (t)-[:ENDED_AT]->(end:Location)
RETURN start.location_id AS start_location, end.location_id AS end_location, COUNT(t) AS trip_count
ORDER BY trip_count DESC
LIMIT 5;


// 4️⃣ Number of Trips by Passenger Count
MATCH (t:Trip)-[:HAS_PASSENGERS]->(p:PassengerGroup)
RETURN p.passenger_count, COUNT(t) AS trip_count
ORDER BY p.passenger_count;


// 5️⃣ Total Revenue by Payment Type
MATCH (t:Trip)-[r:PAID_FOR]->(p:PaymentType)
RETURN p.payment_type_description, SUM(r.total_amount) AS total_revenue, COUNT(t) AS trip_count
ORDER BY total_revenue DESC;


// 6️⃣ Top 10 Most Frequent Departure Locations
MATCH (t:Trip)-[:STARTED_AT]->(l:Location)
RETURN l.location_id, COUNT(t) AS departure_count
ORDER BY departure_count DESC
LIMIT 10;


// 7️⃣ Top 10 Most Frequent Arrival Locations
MATCH (t:Trip)-[:ENDED_AT]->(l:Location)
RETURN l.location_id, COUNT(t) AS arrival_count
ORDER BY arrival_count DESC
LIMIT 10;


// 8️⃣ Details of Trips from Location 48 to Location 107
MATCH (t:Trip)-[:STARTED_AT]->(start:Location {location_id: '48'})
MATCH (t)-[:ENDED_AT]->(end:Location {location_id: '107'})
OPTIONAL MATCH (v:Vendor)-[:PROVIDED]->(t)
OPTIONAL MATCH (t)-[:HAS_PASSENGERS]->(p:PassengerGroup)
OPTIONAL MATCH (t)-[:PAID_FOR]->(pay:PaymentType)
RETURN t, start, end, v, p, pay;
