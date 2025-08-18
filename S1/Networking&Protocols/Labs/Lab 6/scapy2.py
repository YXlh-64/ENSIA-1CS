from scapy.all import *

# Create an ARP packet to request the MAC address associated with an IP address
def create_arp_request(target_ip, source_ip):
    arp_request = ARP(pdst=target_ip, psrc=source_ip, op=1)  # op=1 for an ARP request
    ether_layer = Ether(dst="ff:ff:ff:ff:ff:ff")  # Ethernet frame for broadcast
    arp_packet = ether_layer / arp_request
    return arp_packet

# Send the ARP packet and capture the response
def send_and_receive_arp(packet):
    print("Sending ARP request...")
    response, unanswered = srp(packet, timeout=2, verbose=False)
    return response

# Analyze the ARP response
def analyze_response(response):
    if response:
        for sent, received in response:
            print(f"Target IP address: {received.psrc}")
            print(f"Associated MAC address: {received.hwsrc}")
    else:
        print("No response received. The target machine may be unreachable.")

if __name__ == "__main__":
    # Replace these addresses with your own for testing
    target_ip = "192.168.1.1"  # Target IP address
    source_ip = "192.168.1.100"  # Your local IP address

    # Create an ARP packet
    arp_packet = create_arp_request(target_ip, source_ip)
    print("ARP packet created:")
    arp_packet.show()  # Display the details of the packet

    # Send and receive ARP responses
    response = send_and_receive_arp(arp_packet)

    # Analyze the responses
    analyze_response(response)
