import socket
import time

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('0.0.0.0',12345)) #we are not sure from where the client is attempting to communicate
server.listen(5)
print("Server ready, waiting for connections...")

client_socket, addr = server.accept() #expect a three way handshake and accept it
print(f"Connection established with {addr}")

while True:
 data = client_socket.recv(1024)
 print(f"Data received : {data.decode('utf-8')}")
 time.sleep(5)
 client_socket.sendall(b"Received !") #an acknowledgement from the application layer

client_socket.close()
