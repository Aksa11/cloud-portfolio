from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Cloud Weather App</h1><p>Status: Online and Containerized!</p>"

@app.route('/weather')
def get_weather():
    
    return jsonify({
        "city": "Cloud City",
        "temperature": "22°C",
        "condition": "Sunny",
        "environment": os.getenv("APP_ENV", "Production")
    })

if __name__ == "__main__":
    # We use 0.0.0.0 so the container can be reached from outside
    app.run(host='0.0.0.0', port=5000)
    