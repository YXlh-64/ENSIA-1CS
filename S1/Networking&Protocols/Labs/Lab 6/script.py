from scapy.all import *
print( "Scapy version: " , conf.version)


eth_frame = Ether(dst="ff:ff:ff:ff:ff:ff", src="10:68:38:3e:a9:09", type=0x0806)

# Display the frame details
print ( "Ethernet frame: " )
eth_frame.show()