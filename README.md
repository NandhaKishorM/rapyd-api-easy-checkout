# Groceries Shopping App with depthai and RapydAPI
## An automated checkout using cheap AI depth camera and computer vision
![alt text](https://cdn.antratek.nl/media/product/5ec/luxonis-oak-d-depthai-stereo-camera-sen-17770-549.jpg) 
![alt text](https://www.rapyd.net/wp-content/uploads/2019/10/Screen-Shot-2020-05-27-at-9.23.21-AM.png)
1. deploy the app.py using the given link : https://medium.com/techfront/step-by-step-visual-guide-on-deploying-a-flask-application-on-aws-ec2-8e3e8b82c4f7

## Test the api
### Accept payment
```sh
import requests
import json


url = "http://ec2-65-2-10-243.ap-south-1.compute.amazonaws.com/messages"
body = {"method": "get","path": "/v1/payment_methods/country?country=US&currency=USD"}
headers = {'content-type': 'application/json'}

r = requests.post(url, data=json.dumps(body), headers=headers)
print(r.content)

```

