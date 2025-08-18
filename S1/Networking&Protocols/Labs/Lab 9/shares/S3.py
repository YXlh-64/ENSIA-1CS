from scapy.all import *

packet = IP(dst="8.8.8.8") / UDP(dport=53, sport=88, chksum=0xFFFF) / "Invalid Checksum"
print("Packet Generated: ")
packet.show()

send(packet)


