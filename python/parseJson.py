import requests
import json
import jsonpath

api_url = "https://reqres.in/api/users?page=2"

resp1 = requests.get(api_url)
#print(resp1.text)

assert resp1.status_code==200

json_resp = json.loads(resp1.text)
#print(json_resp)

x = jsonpath.jsonpath(json_resp, 'data[1].first_name')
print(x[0])

for val in json_resp['data']:
    print(val['first_name'])