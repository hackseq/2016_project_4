from flask import render_template, send_from_directory
from flask_cors import CORS, cross_origin
from webapp import webapp

cors = CORS(webapp, resources={r"/*": {"origins": "*"}})

@webapp.route('/')
@webapp.route('/index')
def index():
    return "Hello World!"

@webapp.route('/coverage')
def coverage():
    return render_template('coverage.html',
                           title='Summary of Coverage')

@webapp.route('/<path:path>')
@cross_origin(expose_headers='Range')
def send_file(path):
    return send_from_directory('static/bam', path)



