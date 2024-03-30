import pickle

from flask import Flask, jsonify, request

app = Flask(__name__)

# Load the model using pickle
with open('iris_model.pkl', 'rb') as file:
    model = pickle.load(file)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)
    prediction = model.predict([data['features']])
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')  # Added host='0.0.0.0' to make server externally visible if needed
