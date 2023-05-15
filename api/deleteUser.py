from flask import app,request
from bson.json_util import dumps
from .main import mycollection

 

@app.route("/delete_user/<name>", methods=['DELETE'])
def delete_user_detail(name):
    try:
        x = mycollection.find_one({"name": name})
        status = mycollection.delete_one(x)
        return dumps({'message': 'SUCCESS'})
    except Exception as e:
        return dumps({'error': str(e)})

if (__name__ == "__main__"):
    delete_user_detail()
