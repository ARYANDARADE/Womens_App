import uvicorn
from fastapi import FastAPI
import numpy as np
import pickle
import pandas as pd
from fastapi import FastAPI, UploadFile, File
from io import BytesIO
from PIL import Image
import tensorflow as tf




app = FastAPI()

pickle_in = open ("vigilanceapp.pkl","rb")
classifier=pickle.load(pickle_in)





@app.get('/')
def index():
    return{'message':'hello ,World'}




@app.post('/predict')
def predict_route(data:Route):
    data = data.dict()

    Distance=data['Distance']
    Crime_Rate=data['Crime_Rate']
    CCTV_Cameras=data['CCTV_Cameras']

    test = [[Distance,Crime_Rate,CCTV_Cameras]]

    prediction= classifier.predict(test)


    if (prediction[0]==0):
        prediction ="NEUTRAL"
    elif (prediction[0]==1):
        prediction ="SAFE "
    elif (prediction[0]==2):
        prediction ="UNSAFE ROUTE"
    return {
        'prediction': prediction
    }


if __name__ =='__main__':
    uvicorn.run(app,host='127.0.0.1',port=8000)
#uvicorn app:app --reload
