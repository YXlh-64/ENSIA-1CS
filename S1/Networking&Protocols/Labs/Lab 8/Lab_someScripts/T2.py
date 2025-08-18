from scapy.all import *

#Simulate an ICMP Destination Unreachable message
ip = "10.80.10.28"
ip_header = IP(dst=ip, src=ip)
udp_segment = UDP(sport=1234, dport=80)

icmp_error = IP(src=ip, dst="8.8.8.8") / ICMP(type=3, code=255) / ip_header / udp_segment

#Send the packet

send(icmp_error)

print("ICMP Destination Unreachable message sent.")
