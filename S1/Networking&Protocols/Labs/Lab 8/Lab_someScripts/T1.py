from scapy.all import *

#Building an ICMP Echo Request packet

icmp_request = IP(dst="8.8.8.8") / ICMP(type=8) / "Free food leftover..." #google DNS server
#icmp_request = IP(dst="8.8.8.8") /ICMP(type=3) / bytes(5000)

#Send the packet and receive the reply

response = sr1(icmp_request, timeout=2)

#Check answer
if response:
	print("Response received")
	response.show( )
else:
	print("No response from the server.")
