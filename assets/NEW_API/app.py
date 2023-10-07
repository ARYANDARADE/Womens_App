

import uvicorn
from fastapi import FastAPI
from Routes import Route
import numpy as np
import pickle
import pandas as pd
import tensorflow as tf





app = FastAPI()
#interpreter = tf.saved_model.load("model.tflite")
#interpreter.allocate_tensors()
pickle_in = open("vigilanceapp.pkl","rb")
classifier=pickle.load(pickle_in)



@app.get('/')
def index():
    return{'message':'hello ,World'}


@app.get('/{name}')
def get_name(name:str):
    return {'Welcome here to api': f'{name}'}


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
    uvicorn.run(app,host='192.168.43.141',port=8000)
#cd C:\Users\VARUN\AndroidStudioProjects\Vigilance\assets\NEW_API
#uvicorn app:app --host 192.168.43.141 --port 8000
#uvicorn app:app --reload