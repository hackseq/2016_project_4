from flask import Flask

webapp = Flask(__name__, static_url_path='')
from webapp import views