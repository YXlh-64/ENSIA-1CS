from scapy.all import *

packet =IP(dst="172.20.10.1") /UDP(sport=RandShort(), dport=53) / DNS(rd=1, qd=DNSQR(qname="www.marw.dz"))

response = sr1(packet, verbose=0)
response.show()
