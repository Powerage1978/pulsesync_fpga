-----------
Bram module
-----------

Functional description
----------------------

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
------------------