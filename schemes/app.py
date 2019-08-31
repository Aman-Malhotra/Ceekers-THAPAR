from flask import Flask
from flask_cors import CORS, cross_origin
from flask import jsonify,request
from google.cloud import firestore
import os

app = Flask(__name__)
cors = CORS(app)

db = firestore.Client()

@app.route('/savescheme/', methods=['POST'])
@cross_origin(allow_headers=['Content-Type', 'Authorization'])
def save_scheme():
    # Project ID is determined by the GOOGLE_APPLICATION_CREDENTIALS environment variable
    try:
        data = request.get_json()
        
        scheme=data['scheme']
        time=data['time']
        industry = data['industry']
        overview = data['overview']
        fiscal_incentive = data['fiscal_incentive']

        doc_ref=db.collection(u'schemes').document(u'schemes').collection(industry).document(scheme)
        doc_ref.set({
            u'scheme':scheme,
            u'industry':industry,
            u'time':time,
            u'overview':overview,
            u'fiscal_incentive':fiscal_incentive
        },merge=True)

        return jsonify({"status":"details added for scheme {}".format(scheme)})
    except KeyError as err:
        return jsonify({"error":str(err)})        
    except Exception as err:
        return jsonify({"error":str(err)})

@app.route('/getscheme/', methods=['GET','POST'])
@cross_origin(allow_headers=['Content-Type', 'Authorization'])
def get_scheme():
    # Project ID is determined by the GOOGLE_APPLICATION_CREDENTIALS environment variable
    try:

        data = request.get_json()
        
        industry=data['industry']
        docs = db.collection(u'schemes').document(u'schemes').collection(industry).stream()

        schemelist=[]

        for doc in docs:
            #print(u'{} => {}'.format(doc.id, doc.to_dict()))
            schemelist.append(doc.to_dict())

        return jsonify({"schemes":schemelist})
    except KeyError as err:
        return jsonify({"error":str(err)})        
    except Exception as err:
        return jsonify({"error":str(err)})

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))

