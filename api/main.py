from flask import Flask
from pymongo import MongoClient
from flask import app, request
from bson.json_util import dumps
import json
from flask import Flask
from flask import request
from pymongo import MongoClient
from bson.json_util import dumps
import json
from pymongo import MongoClient
from bson import json_util
from flask import Flask, make_response
from flask_cors import CORS


app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/")
mydatabase = client["grocery_app"]
users = mydatabase["users"]
products = mydatabase["productDetails"]
orders = mydatabase["orders"]
app.__init__


def rep(__self__):
    users.__format__


@app.route("/")
def home():
    return "Welcome!"


@app.route("/add_user", methods=['POST'])
def add_user():
    try:
        data = json.loads(request.data)
        name = data["name"]
        email = data["email"]
        phone = data["phone"]
        password = data["password"]
        # bloodGroup = data["bloodGroup"]
        dup_data = users.distinct("phone")
        print(dup_data)
        if phone not in dup_data:
            status = users.insert_one(
                {
                    "name": name,
                    "email": email,
                    "phone": phone,
                    "password": password,
                }
            )
            print(status)
            responseData = {"Flag": "T", "Status": "User Created Successfully"}

            response = make_response(responseData)
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers[
                "Access-Control-Allow-Methods"
            ] = "GET, POST, PUT, DELETE, OPTIONS"
            response.headers["Access-Control-Allow-Headers"] = "Content-Type"

            return dumps(responseData)
        else:
            return dumps({"Flag": "F", "Status": "User Already Exists"})
    except Exception as e:
        return dumps({"error": str(e)})


@app.route("/login", methods=["POST"])
def login():
    try:
        data = json.loads(request.data)
        email = data["email"]
        password = data["password"]
        x = users.find_one({"email": email})
        print(x)
        if x and x["password"] == password:
            responseData = {"Flag": "T", "Status": "Logged In Successfully"}
            response = make_response(responseData)
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers[
                "Access-Control-Allow-Methods"
            ] = "GET, POST, PUT, DELETE, OPTIONS"
            response.headers["Access-Control-Allow-Headers"] = "Content-Type"
            return dumps(responseData)
        else:
            return dumps({"Flag": "F", "Status": "User Detail Not Found"})

    except Exception as e:
        return dumps({"error": str(e)})


@app.route("/add_product", methods=['POST'])
def add_product():
    try:
        data = json.loads(request.data)
        prod_code = data["prod_code"]
        prod_name = data["prod_name"]
        prod_price = data["prod_price"]
        prod_amount = data["prod_amount"]
        prod_expiry = data["prod_expiry"]
        prod_img = data["prod_img"]

        dup_data = products.distinct("prod_name")

        if prod_name not in dup_data:
            status = products.insert_one(
                {
                    "prod_code": prod_code,
                    "prod_name": prod_name,
                    "prod_price": prod_price,
                    "prod_amount": prod_amount,
                    "prod_expiry": prod_expiry,
                    "prod_img": prod_img,
                }
            )
            print(status)
            responseData = {"Flag": "T",
                            "Status": "Product Created Successfully"}

            response = make_response(responseData)
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers[
                "Access-Control-Allow-Methods"
            ] = "GET, POST, PUT, DELETE, OPTIONS"
            response.headers["Access-Control-Allow-Headers"] = "Content-Type"
            return dumps(responseData)
        else:
            return dumps({"Flag": "F", "Status": "Product Already Exists"})
    except Exception as e:
        return dumps({"error": str(e)})


@app.route("/save_order", methods=['POST'])
def save_order():
    try:
        data = json.loads(request.data)
        prod_code = data["prod_code"]
        prod_name = data["prod_name"]
        prod_price = data["prod_price"]
        prod_amount = data["prod_amount"]
        prod_img = data["prod_img"]


        status = orders.insert_one(
            {
                "prod_code": prod_code,
                "prod_name": prod_name,
                "prod_price": prod_price,
                "prod_amount": prod_amount,
                "prod_img": prod_img,
            }
        )
        print(status)
        prod = orders.find_one({"prod_name": prod_name})
        dumpedData = {
            "prod_code": prod["prod_code"],
            "prod_name": prod["prod_name"],
            "prod_price": prod["prod_price"],
            "prod_amount": prod["prod_amount"],
            "prod_img": prod["prod_img"],
        }

        responseData = {"Flag": "T",
                        "Status": "Product Created Successfully",
                        "data": dumpedData
                        }

        response = make_response(responseData)
        response.headers["Access-Control-Allow-Origin"] = "*"
        response.headers[
            "Access-Control-Allow-Methods"
        ] = "GET, POST, PUT, DELETE, OPTIONS"
        response.headers["Access-Control-Allow-Headers"] = "Content-Type"
        return dumps(responseData)
    except Exception as e:
        return dumps({"error": str(e)})


@app.route("/get_products", methods=['GET'])
def get_all_user():
    try:
        prod = products.find()
        return dumps({"Flag": "T", "Status": prod})
    except Exception as e:
        return dumps({'error': str(e)})
    
@app.route("/get_cart_products", methods=['GET'])
def get_cart_products():
    try:
        prod = orders.find()
        return dumps({"Flag": "T", "Status": prod})
    except Exception as e:
        return dumps({'error': str(e)})

@app.route("/deleteAllorders", methods=["POST"])
def deleteAll():
    try:
        x = orders.delete_many({})
        x.deleted_count
        return dumps("Deleted Successfully")

    except Exception as e:
        return dumps({"error": str(e)})

mobile = '192.168.195.113'
homeIp = '192.168.1.8'
off1 = '192.168.1.102'
if (__name__ == "__main__"):
    app.run(debug=True, host=mobile, port=5000)
