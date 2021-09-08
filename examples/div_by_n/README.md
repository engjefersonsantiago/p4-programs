# DivByN Extern

## Description

This program illustrates as simply as possible how to use a generic extern with the bmv2.

The P4 program only consists of an ingress pipeline, with no tables.
The DivByN extern uses the etherType as the numerator and the denomitator defined with a macro.
The result is written back to the etherType.

### Running the demo

We provide a small demo to let you test the program. It consists of the
following scripts, which you need to run one after the other, in 2 separate
terminals:
- [compile_and_run.sh] (compile_and_run.sh): compile the P4 program and starts the switch,
  also configures the data plane by running the CLI [commands] (commands.txt).
- [send_and_receive.py] (send_and_receive.py): send a packet on port 0 (veth1),
  wait for the forwarded packet on port 3 (veth7).
