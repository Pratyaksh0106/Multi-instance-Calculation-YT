provider "aws" {
  region     = "us-east-1"
  
}

resource "aws_instance" "instance1" {
  ami             = "ami-01816d07b1128cd2d" # Replace with your AMI ID
  instance_type   = "t2.micro"
  key_name        = "Project"
  security_groups = ["launch-wizard-2"]
  tags = {
    Name = "Instance 1"
  }
  # user_data = <<-EOF
  #             #!/bin/bash
  #             sudo yum update -y
  #             sudo yum install python3-pip -y
  #             pip3 install flask

  #             cat <<EOT >> /home/ec2-user/instance1.py
  #             import requests

  #             def forward_to_instance6(num1, num2, add_result, subtract_result, multiply_result, divide_result):
  #                 SAVE_URL = "http://34.203.205.13:5000/save"
  #                 payload = {
  #                     'num1': num1,
  #                     'num2': num2,
  #                     'addition': add_result,
  #                     'subtraction': subtract_result,
  #                     'multiplication': multiply_result,
  #                     'division': divide_result
  #                 }
  #                 response = requests.post(SAVE_URL, json=payload)  
  #                 print(response.json())

  #             def main():
  #                 num1 = float(input("Enter the first number: "))
  #                 num2 = float(input("Enter the second number: "))

  #                 ADD_URL = "http://44.202.106.27:5000/add"
  #                 SUBTRACT_URL = "http://54.210.135.211:5000/subtract"
  #                 MULTIPLY_URL = "http://3.86.105.205:5000/multiply"
  #                 DIVIDE_URL = "http://3.87.75.241:5000/divide"

  #                 payload = {"num1": num1, "num2": num2}

  #                 add_result = requests.post(ADD_URL, json=payload).json()["result"]
  #                 subtract_result = requests.post(SUBTRACT_URL, json=payload).json()["result"]
  #                 multiply_result = requests.post(MULTIPLY_URL, json=payload).json()["result"]
  #                 divide_result = requests.post(DIVIDE_URL, json=payload).json()["result"]

  #                 print(f"Addition Result: {add_result}")
  #                 print(f"Subtraction Result: {subtract_result}")
  #                 print(f"Multiplication Result: {multiply_result}")
  #                 print(f"Division Result: {divide_result}")

  #                 forward_to_instance6(num1, num2, add_result, subtract_result, multiply_result, divide_result)

  #             if __name__ == "__main__":
  #                 main()
  #             EOT
  # EOF
}

resource "aws_instance" "instance2" {
  ami             = "ami-01816d07b1128cd2d" # Replace with your AMI ID
  instance_type   = "t2.micro"
  key_name        = "Project"
  security_groups = ["launch-wizard-2"]
  tags = {
    Name = "Instance 2"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install python3-pip -y
              pip3 install flask

              cat <<EOT >> /home/ec2-user/instance2.py
              from flask import Flask, request, jsonify

              app = Flask(__name__)

              @app.route('/add', methods=['POST'])
              def add():
                  data = request.get_json()
                  num1 = data["num1"]
                  num2 = data["num2"]
                  result = num1 + num2
                  return jsonify({"result": result})

              if __name__ == "__main__":
                  app.run(host="0.0.0.0", port=5000)
              EOT
  EOF
}

# Add similar blocks for instance3, instance4, instance5, and instance6, replacing user_data with the scripts provided for each instance.
resource "aws_instance" "instance3" {
  ami             = "ami-01816d07b1128cd2d" # Replace with your AMI ID
  instance_type   = "t2.micro"
  key_name        = "Project"
  security_groups = ["launch-wizard-2"]
  tags = {
    Name = "Instance 3"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install python3-pip -y
              pip3 install flask

              cat <<EOT >> /home/ec2-user/instance3.py
              from flask import Flask, request, jsonify

              app = Flask(__name__)

              @app.route('/subtract', methods=['POST'])
              def subtract():
                  data = request.get_json()
                  num1 = data["num1"]
                  num2 = data["num2"]
                  result = num1 - num2
                  return jsonify({"result": result})

              if __name__ == "__main__":
                  app.run(host="0.0.0.0", port=5000)
              EOT
  EOF
}
resource "aws_instance" "instance4" {
  ami             = "ami-01816d07b1128cd2d" # Replace with your AMI ID
  instance_type   = "t2.micro"
  key_name        = "Project"
  security_groups = ["launch-wizard-2"]
  tags = {
    Name = "Instance 4"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install python3-pip -y
              pip3 install flask

              cat <<EOT >> /home/ec2-user/instance4.py
              from flask import Flask, request, jsonify

              app = Flask(__name__)

              @app.route('/multiply', methods=['POST'])
              def multiply():
                  data = request.get_json()
                  num1 = data["num1"]
                  num2 = data["num2"]
                  result = num1 * num2
                  return jsonify({"result": result})

              if __name__ == "__main__":
                  app.run(host="0.0.0.0", port=5000)
              EOT
  EOF
}
resource "aws_instance" "instance5" {
  ami             = "ami-01816d07b1128cd2d" # Replace with your AMI ID
  instance_type   = "t2.micro"
  key_name        = "Project"
  security_groups = ["launch-wizard-2"]
  tags = {
    Name = "Instance 5"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install python3-pip -y
              pip3 install flask

              cat <<EOT >> /home/ec2-user/instance5.py
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
              EOT
  EOF
}

resource "aws_instance" "instance6" {
  ami                  = "ami-01816d07b1128cd2d" # Replace with your AMI ID
  instance_type        = "t2.micro"
  key_name             = "Project"
  security_groups      = ["launch-wizard-2"]
  iam_instance_profile = "instance6role"
  tags = {
    Name = "Instance 6"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install python3-pip -y
              pip3 install flask boto3

              cat <<EOT >> /home/ec2-user/save_data.py
              from flask import Flask, request, jsonify
              import boto3
              import uuid
              from decimal import Decimal

              app = Flask(__name__)

              dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
              table = dynamodb.Table('CalculationResults')

              @app.route('/save', methods=['POST'])
              def save_to_dynamodb():
                  data = request.get_json()
                  try:
                      table.put_item(
                          Item={
                              'OperationID': str(uuid.uuid4()),
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
              EOT
  EOF
}

resource "aws_dynamodb_table" "calculation_results" {
  name         = "CalculationResults"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "OperationID"

  attribute {
    name = "OperationID"
    type = "S"
  }

  tags = {
    Name = "CalculationResultsTable"
  }
}
