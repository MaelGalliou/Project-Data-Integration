import pandas as pd
from sqlalchemy import create_engine

#Replace USERNAME and PASSWORD by your username and password to connect to the Data Warehouse
engine = create_engine(
    'mysql+pymysql://USERNAME:PASSWORD@mysql-dataint-project-2k25-sachoun32-b208.g.aivencloud.com:14062/data-warehouse',
    connect_args={"ssl": {}}
)

#Extract
df = pd.read_csv('taxi_trip_data.csv', low_memory=False)
print("Data Extracted Successfully !")

#Transform
df['tpep_pickup_datetime'] = pd.to_datetime(df['tpep_pickup_datetime'], format='%m/%d/%Y %I:%M:%S %p')
df['tpep_dropoff_datetime'] = pd.to_datetime(df['tpep_dropoff_datetime'], format='%m/%d/%Y %I:%M:%S %p')

df['tpep_pickup_datetime'] = df['tpep_pickup_datetime'].dt.strftime('%Y-%m-%d %H:%M:%S')
df['tpep_dropoff_datetime'] = df['tpep_dropoff_datetime'].dt.strftime('%Y-%m-%d %H:%M:%S')

df = df.dropna()

df = df.head(5000) #Because im not using spark or Hadoop so my computer is not good enough to process a lot of data
print("Data Transformed Successfully !")

#Load
vendors = [(1, 'Vendor 1'), (2, 'Vendor 2')]
vendor_df = pd.DataFrame(vendors, columns=['vendor_id', 'vendor_name'])
vendor_df.to_sql('dim_vendor', engine, if_exists='append', index=False)

payment_types = [(1, 'Credit Card'), (2, 'Cash'), (3, 'No Charge'), (4, 'Dispute'), (5, 'Unknown'), (6, 'Voided Trip')]
payment_df = pd.DataFrame(payment_types, columns=['payment_type_id', 'payment_type_desc'])
payment_df.to_sql('dim_payment', engine, if_exists='append', index=False)

fact_trips = df[['VendorID', 'tpep_pickup_datetime', 'tpep_dropoff_datetime', 'passenger_count',
                 'trip_distance', 'RatecodeID', 'PULocationID', 'DOLocationID', 'payment_type',
                 'fare_amount', 'extra', 'mta_tax', 'tip_amount', 'tolls_amount',
                 'improvement_surcharge', 'congestion_surcharge', 'total_amount']]

fact_trips.columns = ['vendor_id', 'tpep_pickup_datetime', 'tpep_dropoff_datetime', 'passenger_count',
                      'trip_distance', 'rate_code_id', 'pickup_location_id', 'dropoff_location_id', 'payment_type_id',
                      'fare_amount', 'extra', 'mta_tax', 'tip_amount', 'tolls_amount',
                      'improvement_surcharge', 'congestion_surcharge', 'total_amount']

fact_trips.to_sql('fact_trips', engine, if_exists='append', index=False)
print("Data Loaded Successfully!")
