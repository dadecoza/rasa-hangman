import json
import requests
import os
from paste.translogger import TransLogger
from flask import Flask, request, send_from_directory, session, url_for, redirect, jsonify, Response, render_template
from waitress import serve

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'GET':
        return redirect(url_for('static', filename='chatbot.html'))
    j = request.json
    sender = str(j["sender"])
    message = str(j["message"])
    session = requests.Session()
    session.trust_env = False
    r = session.post(os.environ["endpoint"], json={
        "sender": sender,
        "message": message
    })
    j = r.json()
    out = []
    for msg in j:
        if "text" in msg:
            out.append(msg["text"])
    return Response(json.dumps(out), mimetype="application/json")


if __name__ == '__main__':
    serve(TransLogger(app, setup_console_handler=False), port=8080)
