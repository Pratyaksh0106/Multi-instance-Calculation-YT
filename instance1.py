import requests

def forward_to_instance6(num1, num2, add_result, subtract_result, multiply_result, divide_result):
    SAVE_URL = "http://<Instance6_IP>:5000/save"  # Replace <Instance6_IP> with Instance 6's private IP
    payload = {
        'num1': num1,
        'num2': num2,
        'addition': add_result,
        'subtraction': subtract_result,
        'multiplication': multiply_result,
        'division': divide_result
    }
    response = requests.post(SAVE_URL, json=payload)
    print(response.json())

def main():
    num1 = float(input("Enter the first number: "))
    num2 = float(input("Enter the second number: "))

    ADD_URL = "http://<Instance2_IP>:5000/add"
    SUBTRACT_URL = "http://<Instance3_IP>:5000/subtract"
    MULTIPLY_URL = "http://<Instance4_IP>:5000/multiply"
    DIVIDE_URL = "http://<Instance5_IP>:5000/divide"

    payload = {"num1": num1, "num2": num2}

    add_result = requests.post(ADD_URL, json=payload).json()["result"]
    subtract_result = requests.post(SUBTRACT_URL, json=payload).json()["result"]
    multiply_result = requests.post(MULTIPLY_URL, json=payload).json()["result"]
    divide_result = requests.post(DIVIDE_URL, json=payload).json()["result"]

    print(f"Addition Result: {add_result}")
    print(f"Subtraction Result: {subtract_result}")
    print(f"Multiplication Result: {multiply_result}")
    print(f"Division Result: {divide_result}")

    # Forward results to Instance 6
    forward_to_instance6(num1, num2, add_result, subtract_result, multiply_result, divide_result)

if __name__ == "__main__":
    main()