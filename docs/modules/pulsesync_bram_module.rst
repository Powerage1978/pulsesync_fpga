---------------------
pulsesync BRAM module
---------------------

Functional description
----------------------

This module implements a simple dual port ram which implements one write interface and one read interface. The write interface is implemented via the AXI4Lite interface from the pulsesync memory block module. The read interface is mapped out into the gate driver module, since it is the only consumer. This the gate driver will see the BRAM section as a read only section and the pulsesync memory block module will se it as a write only block.

I/O description
---------------

====== === ============
Name   I/O Type
====== === ============
clk    In  Logic
rst_n  In  Logic
regceb In  Logic
enb    In  Logic
wea    In  Logic
dina   In  Logic [31:0]
addra  In  Logic [4:0]
addrb  In  Logic [3:0]
doutb  Out Logic [31:0]
====== === ============

- clk:
- rst_n:
- regceb: Output register enable
- enb: Read enable
- wea: Write enable
- dina: RAM input data
- addra: Write address bus
- addrb: Read address bus
- doutb: RAM output data

Timing diagram
--------------

Register definition
-------------------
