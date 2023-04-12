-----------------
Gatedriver module
-----------------

Functional description
----------------------

The gatedriver module sets the pins forcontrolling the transistors for driving the A, B, K and dynamic damper signals. The gate driver synchrounizes towards the sync signal from the TS and monitors if the sync signal arrives within a determined timing threshold, as long as the sync signal complies to threshold values, the gate driver modules keeps driving the transistor signals. If the sync signals comes too early or too late, the gate driver will enter a error state and stop driing the transistor signals, and wil await and active reset of the state machine to be able to restart driving the transistor signals. This acts as an safe guard for keep driving the transistor signals if the system wide communication breaks down.

The threashold values and the actual pattern for driving the transistors are stored withon local blockram transferred from the TS while the gatedriver is in inactive mode. The pattern of the stored values are in pairs of [delay, transistor driver]. The delay is clock cycles until next sync should arrive, and when the sync signals arrives within a given threshold, the transistor driver signal will be output. The storage of the [delay, transistor driver] pairs are implemented as a circular buffer allowing for the system to be running indefinitly as long as the sync signal continously is detected within valid threshold.

I/O description
---------------

================== === ============
Name               I/O Type
================== === ============
clk                In  Logic
rst_n              In  Logic
doutb              In  Logic [31:0]
ctrl_reg           In  Logic [31:0]
external_err       In  Logic
addrb              Out Logic [4:0]
status             Out Logic [31:0]
enb                Out Logic
regceb             Out Logic
state_dbg          Out Logic [3:0]
mode               Out Logic
sync               Out Logic
gate_output_pin[4] Out Logic
gate_output_dbg[4] Out Logic
================== === ============

- clk: Clock signal
- rst_n: reset signal
- doutb: 
- ctrl_reg: control register
- external_err:
- addrb:
- status: status register
- enb:
- regceb:
- state_dbg: Debug signal indicating the state of the internal state machine
- mode: mode indicator, '0' inactive, '1' active
- sync: Asynchronous sync signal from TS
- gate_output_pin[4]: 
- gate_output_dbg[4]: debug signal for the pin output controlloing the A, B and K signals

Timing diagram
--------------

Register definition
------------------

.. wavedrom:: ../wavedrom/gatedriver/status_reg.json
    :caption: Status reg
    :name: status_reg


.. wavedrom:: ../wavedrom/gatedriver/control_reg.json
    :caption: Control reg
    :name: control_reg