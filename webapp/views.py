from flask import render_template, send_from_directory
from flask_cors import CORS, cross_origin
from app import app

cors = CORS(app, resources={r"/*": {"origins": "*"}})

@app.route('/')
@app.route('/index')
def index():
    return "Hello World!"

@app.route('/coverage')
def coverage():
    return render_template('coverage.html',
                           title='Summary of Coverage')

@app.route('/<path:path>')
@cross_origin(headers='Range')
def send_file(path):
    return send_from_directory('static/bam', path)



