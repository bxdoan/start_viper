import requests
from forex_python.converter import CurrencyRates

c = CurrencyRates()
rate = c.get_rate('USD', 'EUR') 
print(rate)
headers = {
  'Accepts': 'application/json',
  'X-CMC_PRO_API_KEY': 'b920da85-c867-4dff-8c01-f9afd17b5c63',
}
params = {
    'symbol': 'ETH',
}
ethereum_api_url = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest'
response = requests.get(ethereum_api_url, params=params, headers=headers)
response_json = response.json()
quote = response_json['data']['ETH'][0]['quote']

price = quote['USD'].get("price")
coin_price = float(("{0:.2f}").format(float(price)))
print("$ " + str(coin_price))
coin_price_eur = float(("{0:.2f}").format(float(price)*rate))
print("€ " + str(coin_price_eur))
