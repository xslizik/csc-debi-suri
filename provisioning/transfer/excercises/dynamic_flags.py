import sys
import dpkt

INVESTIGATE_PCAP = './investigate/investigate.pcap'
TRICKBOT_PCAP = './encrypted/trickbot.pcap'

def replace_string_in_packet(packet, start_index, end_index, replacement_string):
    modified_packet = bytearray(packet)
    modified_packet[start_index:end_index] = replacement_string.encode()
    return bytes(modified_packet)

def flag_one(replacement_string):
    with open(INVESTIGATE_PCAP, 'rb') as f:
        pcap = dpkt.pcap.Reader(f)
        packets = list(pcap)

    packet_to_modify = packets[668][1]
    new = replace_string_in_packet(packet_to_modify, 234, 259, replacement_string)

    packets[668] = (packets[668][0], new)

    with open(INVESTIGATE_PCAP, 'wb') as f:
        pcap_writer = dpkt.pcap.Writer(f)
        for timestamp, buf in packets:
            pcap_writer.writepkt(buf, timestamp)

def flag_two(replacement_string):
    with open(TRICKBOT_PCAP, 'rb') as f:
        pcap = dpkt.pcap.Reader(f)
        packets = list(pcap)

    packet_to_modify = packets[95][1]
    new = replace_string_in_packet(packet_to_modify, 100, 104, replacement_string)

    packets[95] = (packets[95][0], new)

    with open(TRICKBOT_PCAP, 'wb') as f:
        pcap_writer = dpkt.pcap.Writer(f)
        for timestamp, buf in packets:
            pcap_writer.writepkt(buf, timestamp)

def main():
    if len(sys.argv) > 2:
        flag_one(sys.argv[1])
        flag_two(sys.argv[2])

if __name__ == '__main__':
    main() 