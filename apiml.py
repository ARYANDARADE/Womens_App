from fastapi import FastAPI   
from pydantic import BaseModel
import pickle
import pandas as pd

app = FastAPI()

class SafetyScore(BaseModel):
    

    Distance:float #0.5
    CrimeRate: float #1.5  
    CCTVCameras:int #5

with open('vigilanceapp.pkl','rb') as f :
    model = pickle.load(f)


@app.post('/')
async def give_pred(safetyscore:SafetyScore):
    df = pd.DataFrame([safetyscore.dict().values()],columns=safetyscore.dict().keys())
    yhat = model.predict(df)
    return {"prediction":int(yhat)}
    return safetyscore



# @app.get('/')
# async def scoring_endpoint():
#     return{"hello":"world"}
    
