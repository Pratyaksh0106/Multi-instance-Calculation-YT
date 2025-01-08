from flask import Flask, request, jsonify
import boto3
import uuid
from decimal import Decimal

app = Flask(__name__)

# Connect to DynamoDB
dynamodb = boto3.resource('dynamodb', region_name='us-east-1')  # Replace with your region
table = dynamodb.Table('CalculationResults')  # Ensure this table exists

@app.route('/save', methods=['POST'])
def save_to_dynamodb():
    data = request.get_json()
    try:
        # Convert float values to Decimal
        table.put_item(
            Item={
                'OperationID': str(uuid.uuid4()),  # Unique ID for each operation
                'Num1': Decimal(str(data['num1'])),
                'Num2': Decimal(str(data['num2'])),
                'Addition': Decimal(str(data['addition'])),
                'Subtraction': Decimal(str(data['subtraction'])),
                'Multiplication': Decimal(str(data['multiplication'])),
                'Division': Decimal(str(data['division']))
            }
        )
        return jsonify({'message': 'Data saved to DynamoDB successfully!'})
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)