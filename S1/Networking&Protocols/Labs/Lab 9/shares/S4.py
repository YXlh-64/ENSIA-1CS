from scapy.all import *

target_ip = "10.80.1.1"

ports = [53, 67, 123, 500]


for port in ports:
 packet = IP(dst=target_ip) / UDP(dport=port)
 response = sr1(packet, timeout=1, verbose=0)
 if response:
  print(f"Response received on port {port}")
 else:
  print(f"No response on port {port}")
