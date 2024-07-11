# Import libraries

import json
import pandas as pd
import psycopg2
import datetime

from requests import Request, Session
from io import StringIO, BytesIO
from requests.exceptions import ConnectionError, Timeout, TooManyRedirects


# Extract data from API
# Documentation: https://coinmarketcap.com/api/documentation/v1/#operation/getV1CryptocurrencyMap

url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
api_key = '83f659b5-cb23-45e9-87f2-733a317f404d'

parameters = {
  'start':'1',
  'limit':'5000',
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
