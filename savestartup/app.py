from flask import Flask
from flask_cors import CORS, cross_origin
from flask import jsonify,request
from google.cloud import firestore
import os

app = Flask(__name__)
cors = CORS(app)

db = firestore.Client()

@app.route('/savestartup/', methods=['POST'])
@cross_origin(allow_headers=['Content-Type', 'Authorization'])
def save_startup():
    # Project ID is determined by the GOOGLE_APPLICATION_CREDENTIALS environment variable
    try:
        data = request.get_json()
        
        name=data['Name']
        ceo=data['CEO']
        stage = data['Stage']
        state = data['State']
        city = data['City']

        funding = data['Funding']
        
        
        industry=data['Industry']
        sector=data['Sector']
        age=data['Age']
        gender=data['Gender']
        noofppl=data['NoOfPpl']
        date=data['Date']
        approve=data['approve']

        doc_ref=db.collection(u'startup').document()
        startup_id=doc_ref.id
        doc_ref.set({
            u'Name':name.lower(),
            u'CEO':ceo.lower(),
            u'Stage':stage.lower(),
            u'State':state.lower(),
            u'City':city.lower(),
            u'Funding': funding.lower(),
            u'Industry':industry.lower(),
            u'Sector':sector.lower(),
            u'Age':age,
            u'Gender':gender.lower(),
            u'NoOfPpl':noofppl,
            u'date':date,
            u'approve':approve
        },merge=True)

        return jsonify({"status":"details added for startup {}".format(name)})
    except KeyError as err:
        return jsonify({"error":str(err)})        
    except Exception as err:
        return jsonify({"error":str(err)})

@app.route('/getstartup/', methods=['GET'])
@cross_origin(allow_headers=['Content-Type', 'Authorization'])
def get_startup():
    # Project ID is determined by the GOOGLE_APPLICATION_CREDENTIALS environment variable
    try:
        docs = db.collection(u'startup').stream()
        startuplist=[]

        for doc in docs:
            #print(u'{} => {}'.format(doc.id, doc.to_dict()))
            sdict=doc.to_dict()
            sdict['sid']=doc.id
            startuplist.append(sdict)


        return jsonify({"startup":startuplist})
    except KeyError as err:
        return jsonify({"error":str(err)})        
    except Exception as err:
        return jsonify({"error":str(err)})

@app.route('/approvestartup/', methods=['POST'])
@cross_origin(allow_headers=['Content-Type', 'Authorization'])
def approve_startup():
    # Project ID is determined by the GOOGLE_APPLICATION_CREDENTIALS environment variable
    try:
        data = request.get_json()
        
        sid=data['sid']

        approve=1

        doc_ref=db.collection(u'startup').document(sid)
        doc_ref.set({
            u'approve':str(approve)
        },merge=True)

        return jsonify({"{} is approved".format(sid)})
    except KeyError as err:
        return jsonify({"error":str(err)})        
    except Exception as err:
        return jsonify({"error":str(err)})

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))

