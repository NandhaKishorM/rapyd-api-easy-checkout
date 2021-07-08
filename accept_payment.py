
import requests
import json


url = "http://ec2-65-2-10-243.ap-south-1.compute.amazonaws.com/messages"
body = {"method": "get","path": "/v1/payment_methods/country?country=US&currency=USD"}
headers = {'content-type': 'application/json'}

r = requests.post(url, data=json.dumps(body), headers=headers)
print(r.content)
