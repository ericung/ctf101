from pwn import *

host = '127.0.0.1'  
port = 8080

try:
    conn = remote(host, port)
    print(f"Successfully connected to {host}:{port}")

    payload = b"Hello, server!\n"
    conn.send(payload)
    print(f"Sent: {payload}")

    response = conn.recvline()
    print(f"Received: {response.strip().decode()}")

    conn.close()
    print("Connection closed.")

except ConnectionRefusedError:
    print(f"Connection refused by {host}:{port}. Make sure the service is running.")
except Exception as e:
    print(f"An error occurred: {e}")

