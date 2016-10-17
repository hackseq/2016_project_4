from flask import render_template, request
from webapp import webapp

@webapp.route('/')
@webapp.route('/index')
def index():
    return render_template('index.html',
                           title='Home')

@webapp.route('/coverage')
def coverage():
    return render_template('coverage.html',
                           title='Summary of Coverage')

@webapp.route('/get_region', methods=['POST'])
def get_region():
    chromosome = request.json['chr']        # this is a string
    viewstart = request.json['viewStart']   # this is an int
    viewend = request.json['viewEnd']       # this is an int
    sources = request.json['sources']
    return str(viewend)


@webapp.route('/about')
def about():
    return render_template('about.html', title='About the Team')

@webapp.route('/data')
def data():
    return render_template('data.html', title='Data Provenance')
