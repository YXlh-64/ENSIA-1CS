import socket
import time

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('127.0.0.1',12345))

time.sleep(10)

for i in range(5):
 message = f"Message {i+1}".encode('utf-8')
 client.sendall(message)
 response = client.recv(1024)
 print(f"Server response : {response.decode('utf-8')}")
 time.sleep(1) #pause between each transmission

client.close()
