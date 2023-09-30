# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import uvicorn
from fastapi import FastAPI
from Routes import Route
import numpy as np
import pickle
import pandas as pd
import tensorflow as tf




app = FastAPI()
interpreter = tf.saved_model.load("model.tflite")
interpreter.allocate_tensors()



@app.get('/')
def index():
    return{'message':'hello ,World'}


@app.get('/{name}')
def get_name(name:str):
    return {'Welcome here to api': f'{name}'}

@app.post('/chat_bot')
def chat_bot(question: str):

    ask= question

    answer=model.response(ask)
    return {
        'answer' : answer
    }




if __name__ =='__main__':
    uvicorn.run(app,host='0.0.0.0',port=8000)
#uvicorn app:app --host 127.0.0.1 --port 8000
#uvicorn app:app --reload