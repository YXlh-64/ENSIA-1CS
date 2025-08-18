import socket
import time


server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('0.0.0.0',12345))
server.listen(5)
print("Server ready, waiting for connections...")

client_socket, addr = server.accept()
print(f"Connection established with {addr}")

while True:
 data = client_socket.recv(1024)
 if "2" in data.decode('utf-8'):
  continue 
 print(f"Data received : {data.decode('utf-8')}")
 client_socket.sendall(b"Received !")

client_socket.close()
