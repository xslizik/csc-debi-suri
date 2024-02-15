import sys
import dpkt

EXCERCISE_ONE = './encrypted/ja3_fingerprints.rules'
EXCERCISE_TWO = './investigate/agent_tesla.pcap'

def replace_string_in_packet(packet, start_index, end_index, replacement_string):
    modified_packet = bytearray(packet)
    modified_packet[start_index:end_index] = replacement_string.encode()
    return bytes(modified_packet)

def one(new_signature_id):
    with open(EXCERCISE_ONE, "r+") as f:
        contents = f.read()
        new_contents = contents.replace("$", new_signature_id)
        f.seek(0)
        f.write(new_contents)
        f.truncate()

def two(replacement_string):
    with open(EXCERCISE_TWO, 'rb') as f:
        pcap = dpkt.pcap.Reader(f)
        packets = list(pcap)

    packet_to_modify = packets[668][1]
    new = replace_string_in_packet(packet_to_modify, 234, 259, replacement_string)

    packets[668] = (packets[668][0], new)

    with open(EXCERCISE_TWO, 'wb') as f:
        pcap_writer = dpkt.pcap.Writer(f)
        for timestamp, buf in packets:
            pcap_writer.writepkt(buf, timestamp)

def main():
    if len(sys.argv) > 2:
        new_signature_id = sys.argv[1]
        replacement_string = sys.argv[2]

        one(new_signature_id)
        two(replacement_string)

if __name__ == '__main__':
    main() 