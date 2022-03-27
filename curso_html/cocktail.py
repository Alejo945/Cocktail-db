import logging
import sys
logging.basicConfig(stream=sys.stderr)

from cocktail import create_app

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)