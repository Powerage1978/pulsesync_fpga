-----------------------------
Pulsesync memory block module
-----------------------------

Functional description
----------------------

The pulsesync memory block module maps the memory mapped registers and the BRAM section into a coherent memory segment that can be access through an AXI4Lite interface from the Zynq processing unit. THis allows for an user space driver to perform read and write operations towards memory address to write to control registers and read back from status registers, that are updated by the logic. 

The memory block module segments the access to the BRAM section and the memory mapped registers.

I/O description
---------------

Timing diagram
--------------

Register definition
-------------------
