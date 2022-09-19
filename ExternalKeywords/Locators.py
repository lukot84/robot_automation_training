import  json
import jsonpath

def read_locator_from_json(locatorname):
    f = open("C:/Users/Lukasz_Kot/.vscode/robot/jsonFiles/Elements.json")
    resp = json.loads(f.read())
    value = jsonpath.jsonpath(resp, locatorname)
    return value[0]