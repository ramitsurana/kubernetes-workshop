#!/usr/bin/python3

from flask import Flask
import json
 
app = Flask(__name__)
 
@app.route('/')
def hello(event, context):
    message = "Hi " + event['data'] + ", My name is Voldermort !. Nice to meet you."
    return event['data']