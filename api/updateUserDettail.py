
from flask import app,request
from bson.json_util import dumps
from .main import mycollection
import json

@app.route("/update_user_detail/<name>", methods=['PUT'])
def update_user_detail(name):
    try:
        data = json.loads(request.data)
        x = mycollection.find_one({"name": name})
        myquery = {"name": x['name']}
        newvalues = {
            "$set": {
                "name": data["name"],
                "email": data["email"],
                "password": data["password"],
                "phone": data["phone"]
            }
        }
        status = mycollection.update_one(myquery, newvalues)
        print(status)
        return dumps({'message': 'SUCCESS'})
    except Exception as e:
        return dumps({'error': str(e)})

if (__name__ == "__main__"):
    update_user_detail()