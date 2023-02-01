from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def index():
    env_01 = os.environ.get("ENV_01")
    env_02 = os.environ.get("ENV_02")
    env_03 = os.environ.get("ENV_03")
    return f"ENV_01: {env_01}<br>ENV_02: {env_02}<br>ENV_03: {env_03}"

if __name__ == "__main__":
    app.run(debug=True)
