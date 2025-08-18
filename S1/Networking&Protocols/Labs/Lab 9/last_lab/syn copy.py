from scapy.all import *

#you should receive an RST
#if you send the data, no body is listening or if they don't wanna talk to you, you will receive an RST
#RST for finishing the connection prematurely
target_ip = "10.80.1.1"
target_port = 53

syn_packet = IP(dst=target_ip)/TCP(dport=target_port, flags="S")
syn_response = sr1(syn_packet)
print(syn_response.summary())

#pa for push ack
data_packet = IP(dst=target_ip) / TCP(dport=target_port, flags="A", seq=syn_response.ack, ack=syn_response.seq+1)

send(data_packet)

print("3 way handshake finished")
