from flask import app
from bson.json_util import dumps
from .main import mycollection

@app.route("/get_all_user", methods=['GET'])
def get_all_user():
    try:
        user = mycollection.find()
        return dumps(user)
    except Exception as e:
        return dumps({'error': str(e)})

if (__name__ == "__main__"):
    get_all_user()