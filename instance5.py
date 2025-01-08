from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/divide', methods=['POST'])
def divide():
    data = request.get_json()
    num1 = data["num1"]
    num2 = data["num2"]
    if num2 == 0:
        result = "Infinity"  # Handle division by zero
    else:
        result = num1 / num2
    return jsonify({"result": result})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)