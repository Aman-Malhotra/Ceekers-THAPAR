from flask import Flask
from flask_cors import CORS, cross_origin
from flask import jsonify,request
#from google.cloud import firestore
import os
import requests

app = Flask(__name__)
cors = CORS(app)

#db = firestore.Client()

subscription_key = "d691c241f290454eb8b2433b676329eb"
search_url = "https://api.cognitive.microsoft.com/bing/v7.0/news/search"
headers = {"Ocp-Apim-Subscription-Key" : subscription_key}

def get_news(keyword):
    
    search_term = "{}".format(keyword)
    #print(search_term)
    params  = {"q": search_term, "textDecorations": True, "textFormat": "HTML"}

    response = requests.get(search_url, headers=headers, params=params)
    response.raise_for_status()
    search_results = response.json()
    
    return search_results['value']

@app.route('/getnews/', methods=['GET','POST'])
@cross_origin(allow_headers=['Content-Type', 'Authorization'])
def save_scheme():
    # Project ID is determined by the GOOGLE_APPLICATION_CREDENTIALS environment variable
    try:
        data = request.get_json()
        
        sname=data['sname']

        return jsonify({"news":get_news(sname)})
    except KeyError as err:
        return jsonify({"error":str(err)})        
    except Exception as err:
        return jsonify({"error":str(err)})


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))

