from flask import render_template, send_from_directory
from flask_cors import CORS, cross_origin
from webapp import webapp

cors = CORS(webapp, resources={r"/*": {"origins": "*"}})

@webapp.route('/')
@webapp.route('/index')
def index():
    return render_template('index.html',
                           title='Home')

@webapp.route('/coverage')
def coverage():
    return render_template('coverage.html',
                           title='Summary of Coverage')



