import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello_world():
    return jsonify({
        "status": "success",
        "message": "GCP Cloud Build Triggered Successfully! done",
        "framework": "Flask",
        "language": "Python 3.11"
    })

if __name__ == "__main__":
    # GCP Cloud Run/Build uses the PORT environment variable
    port = int(os.environ.get("PORT", 8080))
    app.run(host='0.0.0.0', port=port)
