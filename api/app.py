import os
from flask import Flask,request
from flask_cors import CORS
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
import datetime
import json
cors = CORS()

df = pd.read_excel('master_blood.xlsx')

df['Mobile'] = df['Mobile'].apply(str)
df['Wt.'] = df['Wt.'].apply(str)
df['Hb%'] = df['Hb%'].apply(str)

a = list(df['BLOOD GROUP'])
b = set(df['BLOOD GROUP'])
totalData = {}

for i in b:
    print(i,end=" ")
    print(a.count(i))
    totalData[i] = a.count(i)
totalData['total'] = len(df)

arr = df['BLOOD GROUP']

label = {k:i for i, k in enumerate(df['BLOOD GROUP'].unique(),0)}
arr = arr.map(label)


cn = {}
kmeans = KMeans(n_clusters=8)
arr = np.array(arr)
arr = arr.reshape(-1,1)
kmeans.fit(arr)
for i in set(kmeans.labels_):    
    #for i in set(kmeans.labels_):
    temp=[]
    tem = round(kmeans.cluster_centers_[i][0])
    for j in range(len(kmeans.labels_)):
        if kmeans.labels_[j] == i:
            #print(j,end = " ")
            temp.append(j)
    cn[tem] = temp
    print(len(temp))

print(kmeans.cluster_centers_)

def string(lm):
    s = ''
    for i in lm:
        if isinstance(i,str):
            s = s +'\n'+ i
    return s
    

def getDetails(n):
    lm = []
    count =0 
    import datetime
    for j in n:
        if(df['Count'][j]==0):
            lm.append(json.loads(df.iloc[j].to_json()))
            count+=1
            if count == 3:
                break
    for i in n:    
        if df['Remarks'][i]==0 and df['Remarks'][i]=='TAB TAKEN' or df['Remarks'][i]=='FEVER':
            lm.append(json.loads(df.iloc[i].to_json()))
            count+=1
            if count == 3:
                break
    for i in n:    
        d1 = datetime.datetime.now().date()
        t = ( df['Last'][i].date())
        delta = d1-t
        #print(delta.days)
        if delta.days > 180:
            lm.append(json.loads(df.iloc[i].to_json()))
            count+=1
            if count == 5:
                break
    return lm

def get(i):
    if i in ['O-POSITIVE','O+','o+','O POSITIVE','o positive']:
        return(getDetails(cn[1]))
    if i in ['O-NEGATIVE','O-','o-','O NEGATIVE','o negative']:
        return(getDetails(cn[5]))
    if i in ['A-POSITIVE','A+','a+','A POSITIVE','a positive']:
        return(getDetails(cn[3]))
    if i in ['B-POSITIVE','B+','b+','B POSITIVE','b positive']:
        return(getDetails(cn[2]))
    if i in ['AB-POSITIVE','AB+','ab+','AB POSITIVE','ab negative']:
        return(getDetails(cn[-0]))
    if i in ['B-NEGATIVE','B-','b-','B NEGATIVE','b negative']:
        return(getDetails(cn[4]))
    if i in ['A-NEGATIVE','A-','a-','A NEGATIVE','a negative']:
        return(getDetails(cn[6]))
    if i in ['AB-NEGATIVE','AB-','ab-','AB NEGATIVE']:
        return(getDetails(cn[7]))
            
app = Flask(__name__)
cors.init_app(app)

@app.route('/')
def api_getDetails():
    global totalData
    print(totalData)
    return {'data':totalData}


@app.route("/<var>")
def hello(var):
    return get(var)

@app.route('/register',methods=['GET','POST'])
def register():
    print(request.json)

    print(type(request.json))
    global df,totalData,arr
    df2 = pd.DataFrame.from_dict(request.json)
    print(df2)
    df = pd.concat([df, df2], ignore_index=True, sort=False)
    # df.to_excel('master_blood.xlsx')
    print(len(df))
    df['Mobile'] = df['Mobile'].apply(str)
    df['Wt.'] = df['Wt.'].apply(str)
    df['Hb%'] = df['Hb%'].apply(str)

    a = list(df['BLOOD GROUP'])
    b = set(df['BLOOD GROUP'])
    totalData = {}

    for i in b:
        print(i,end=" ")
        print(a.count(i))
        totalData[i] = a.count(i)
    totalData['total'] = len(df)

    arr = df['BLOOD GROUP']

    label = {k:i for i, k in enumerate(df['BLOOD GROUP'].unique(),0)}
    arr = arr.map(label)


    cn = {}
    kmeans = KMeans(n_clusters=8)
    arr = np.array(arr)
    arr = arr.reshape(-1,1)
    kmeans.fit(arr)
    for i in set(kmeans.labels_):    
        #for i in set(kmeans.labels_):
        temp=[]
        tem = round(kmeans.cluster_centers_[i][0])
        for j in range(len(kmeans.labels_)):
            if kmeans.labels_[j] == i:
                #print(j,end = " ")
                temp.append(j)
        cn[tem] = temp
        print(len(temp))

    print(kmeans.cluster_centers_)

    return request.json


if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True,port=int(os.environ.get('PORT', 5000)))
