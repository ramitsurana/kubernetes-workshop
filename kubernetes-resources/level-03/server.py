#!/usr/bin/python3

from flask import Flask
 
app = Flask(__name__)
 
@app.route('/')
def hello(event, context):
    print(event)
    return event['data']