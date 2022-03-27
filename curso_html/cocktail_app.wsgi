#! /usr/bin/python 
home_dir = '/home/gelpi/DEVEL/WWW/DBW/py_cocktail_app'
activate_this = home_dir + '/venv/bin/activate_this.py'
with open (activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))

import logging
import sys
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, home_dir)
from cocktaimport create_app
application = create_app()

