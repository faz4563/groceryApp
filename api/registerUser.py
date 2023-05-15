from flask import app, request
from bson.json_util import dumps
import json
from pymongo import MongoClient
from .main import mycollection
@app.route("/add_user", methods=['POST'])
def add_user():
    try:
        data = json.loads(request.data)
        name = data['name']
        email = data['email']
        password = data['password']
        phone = data["phone"]


        dup_data = mycollection.distinct("phone")
        print(dup_data)
        if (phone not in dup_data):
            status = mycollection.insert_one({
                "name": name,
                "email": email,
                "password": password,
                "phone": phone
            })
            print(status)
            return dumps({'Status': 'User Created Successfully'})
        else:
            return dumps({'Status': 'User Already Exists'})
    except Exception as e:
        return dumps({'error': str(e)})
if (__name__ == "__main__"):
    add_user()