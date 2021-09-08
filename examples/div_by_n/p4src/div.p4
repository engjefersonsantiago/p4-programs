/*
 * Jeferson Santiago da Silva (eng.jefersonsantiago@gmail.com)
 */

#include <core.p4>
#include <v1model.p4>

#ifndef DEN
#define DEN 5
#endif

extern DivByN<T> {
   	DivByN(bit<1> verbose); 
    void divide(in T num, in T den, inout T result);
}

header ethernet_t {
        bit<48> dstAddr;
        bit<48> srcAddr;
        bit<16> etherType;
}

// List of all recognized headers
struct parsed_packet {
    ethernet_t ethernet;
}

struct metadata {
	//@metadata @name("intrinsic_metadata")
	//intrinsic_metadata_t intrinsic_metadata;
   bit <1> p;
}

parser TopParser(packet_in b,
				out parsed_packet p,
				inout metadata meta,
				inout standard_metadata_t standard_metadata) {

    state start {
        b.extract(p.ethernet);
		transition accept;
    }
}

control ingress(inout parsed_packet headers,
				inout metadata meta,
                inout standard_metadata_t standard_metadata) {

	@userextern @name("my_div")
	DivByN<bit<16>>(1) my_div;
        bit <16> result=0;
	apply {
		my_div.divide(headers.ethernet.etherType, (bit<16>)(DEN), result);
		headers.ethernet.etherType = result;
		standard_metadata.egress_spec = 3;
		standard_metadata.egress_port = 3;
	}
}

control egress (inout parsed_packet headers,
				inout metadata meta,
                inout standard_metadata_t standard_metadata) {
	apply {}
}

control ver_chsum(inout parsed_packet p, inout metadata meta) {

	apply {}
}

control up_cksum(inout parsed_packet p, inout metadata meta) {
	apply {}
}

// deparser section
control deparser(packet_out b, in parsed_packet p) {
    apply {
        b.emit(p.ethernet);
    }
}

V1Switch(TopParser(),
	ver_chsum(),
	ingress(),
	egress(),
	up_cksum(),
	deparser()) main;
