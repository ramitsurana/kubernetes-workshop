#!/usr/bin/python3

from flask import Flask
import json
 
app = Flask(__name__)
 
@app.route('/')
def hello(event, context):
    return event['data']