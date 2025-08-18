from scapy.all import *



packet = IP(dst="192.168.66.66") / UDP(dport=54321) / "Hello"
print("Packet Generated: ")
packet.show()

send(packet)


