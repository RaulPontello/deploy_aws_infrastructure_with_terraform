# Import libraries

import json
import pandas as pd
import psycopg2
import datetime
import boto3
import os
import time

from botocore.exceptions import ClientError
from requests import Request, Session
from io import StringIO, BytesIO
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects

def extract_data_from_api():
  
  # Extract data from API
  # Documentation: https://coinmarketcap.com/api/documentation/v1/#operation/getV1CryptocurrencyMap

  url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
  api_key = '83f659b5-cb23-45e9-87f2-733a317f404d'

  parameters = {
    'start':'1',
    'limit':'1000',
  }
  headers = {
    'Accepts': 'application/json',
    'X-CMC_PRO_API_KEY': api_key,
  }

  session = Session()
  session.headers.update(headers)
  response = session.get(url, params=parameters)
  data = json.loads(response.text)

  # Create dataframe to store all data

  columns = ['id', 'name', 'symbol', 'last_updated', 'circulating_supply',
            'total_supply', 'max_supply', 'price', 'volume_24h', 'percent_change_1h', 'percent_change_7d']

  df = pd.DataFrame(columns = columns)

  for coin in data['data']:
      id = coin['id']
      name = coin['name']
      symbol = coin['symbol']
      last_updated = coin['last_updated']
      circulating_supply = coin['circulating_supply']
      total_supply = coin['total_supply']
      max_supply = coin['max_supply']
      price = coin['quote']['USD']['price']
      volume_24h = coin['quote']['USD']['volume_24h']
      percent_change_1h = coin['quote']['USD']['percent_change_1h']
      percent_change_24h = coin['quote']['USD']['percent_change_24h']
      percent_change_7d = coin['quote']['USD']['percent_change_7d']

      data_dict = {'id': id, 
                  'name': name, 
                  'symbol': symbol,
                  'last_updated': last_updated,
                  'circulating_supply': circulating_supply,
                  'total_supply': total_supply,
                  'max_supply': max_supply,
                  'price': price,
                  'volume_24h': volume_24h,
                  'percent_change_1h': percent_change_1h,
                  'percent_change_7d': percent_change_7d}

      df = pd.concat([df, pd.DataFrame([data_dict])], ignore_index=True)

  return df


def get_secret():
    secret_name = "rds_db_credentials"
    region_name = "us-east-1"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        raise e

    secret = get_secret_value_response['SecretString']
    return json.loads(secret)


def lambda_handler(event, context):
    df = extract_data_from_api()
    secret = get_secret()
    database = 'crypto_database'
    username = 'terraform_db'
    password = 'terraform_pw'
    host = 'terraform-rds-database.cqazldnedfyl.us-east-1.rds.amazonaws.com'
    
    conn = psycopg2.connect(
        database = database,
        host     = host,
        port     = '5432',
        user     = username,
        password = password
    )
    
    cursor = conn.cursor()
    
    # Create table

    query = '''create table crypto_table (
                  id int, 
                  name varchar(50), 
                  symbol varchar(50), 
                  last_updated date,
                  circulating_supply float, 
                  total_supply float, 
                  max_supply float, 
                  price float,
                  volume_24h float, 
                  percent_change_1h float, 
                  percent_change_7d float 
                  )
                  '''

    cursor.execute(query)
    time.sleep(20)

    # Insert data from df

    for index, row in df.iterrows():
        query = '''INSERT INTO crypto_table

                  (id, name, symbol, last_updated, circulating_supply, total_supply, 
                    max_supply, price, volume_24h, percent_change_1h, percent_change_7d) 

                  values(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''

        id = int(row['id']) if row['id'] is not None else None
        name = str(row['name']) if row['name'] is not None else None 
        symbol = str(row['symbol']) if row['symbol'] is not None else None
        last_updated = row['last_updated'][0:10]
        last_updated = datetime.datetime.strptime(last_updated, '%Y-%m-%d') if row['last_updated'] is not None else None
        circulating_supply = float(row['circulating_supply']) if row['circulating_supply'] is not None else None 
        total_supply = float(row['total_supply']) if row['total_supply'] is not None else None
        max_supply = float(row['max_supply']) if row['max_supply'] is not None else None 
        price = float(row['price']) if row['price'] is not None else None 
        volume_24h = float(row['volume_24h']) if row['volume_24h'] is not None else None
        percent_change_1h = float(row['percent_change_1h']) if row['percent_change_1h'] is not None else None
        percent_change_7d = float(row['percent_change_7d']) if row['percent_change_7d'] is not None else None
      
        values = id, name, symbol, last_updated, circulating_supply, total_supply, \
                max_supply, price, volume_24h, percent_change_1h, percent_change_7d 

        cursor.execute(query, values)

    conn.commit()

    # Close all database connections

    cursor.close()
    conn.close()


