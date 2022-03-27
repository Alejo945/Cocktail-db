#!/bin/tcsh
source venv/bin/activate.csh
setenv FLASK_APP cocktail_app
setenv FLASK_ENV development
setenv FLASK_RUN_PORT 5001
flask run
