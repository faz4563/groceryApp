
from flask import app
from bson.json_util import dumps
from .main import mycollection


@app.route("/get_user_detail/<name>", methods=['GET'])
def get_user_detail(name):
    try:
        x = mycollection.find_one({"name": name})
        return dumps(x)
    except Exception as e:
        return dumps({'error': str(e)})
    
if (__name__ == "__main__"):
    get_user_detail()
