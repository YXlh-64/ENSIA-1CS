from scapy.all import *


print("Sniffing UDP packets: ")
sniff(filter="udp and port 53", prn=lambda x: x.show(), count=5)


