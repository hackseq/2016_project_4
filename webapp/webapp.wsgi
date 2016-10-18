import sys
import logging
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, "/home/ubuntu/2016_project_4/webapp")

from webapp import webapp as application
application.secret_key = "wobbling_wallabies"
