---------------------
Sync generator module
---------------------

Functional description
----------------------

The sync generator module is responsible for generating an output that drives the transistors thats moves energy onto the output loop, based on a sync signal received from the TS. The sync generator has a table of value pairs containing a delay and a output value. The delay defines the time for next sync pulse to arrive, and if the sync pulse arrives within a well-defined window for that delay, the corresponding output value will be used for driving the transistors. If the sync pulse arrives too early or too late, the sync generator will see this as an error and enter an error state and drive the transistors in a permanent position where no energy is transmitted onto the loop. This safety mechanism serves as mechanism to ensure that if missing pulse signals occur (due to bad cabling, faulty equipment etc.), the energy transmitted onto the loop will terminate itself before energy levels will reach a to high potential. It will also prevent spurious sync signals to generator an unwanted signal pattern on the output loop.

I/O description
---------------

Timing diagram
--------------

Register definition
-------------------


.. wavedrom:: ../wavedrom/sync_gen_ctrl.json
  :caption: Sync generator control reg
