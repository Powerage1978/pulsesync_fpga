-----------------
Gatedriver module
-----------------

Functional description
----------------------

The gate driver module sets the pins for controlling the transistors for driving the A, B, K and dynamic damper signals. The gate driver synchronizes towards the sync signal from the TS and monitors if the sync signal arrives within a determined timing threshold, as long as the sync signal complies to threshold values, the gate driver modules keeps driving the transistor signals. If the sync signals comes too early or too late, the gate driver will enter a error state and stop driving the transistor signals, and wil await and active reset of the state machine to be able to restart driving the transistor signals. This acts as an safe guard for keep driving the transistor signals if the system wide communication breaks down.

The threshold values and the actual pattern for driving the transistors are stored within local blockram transferred from the TS while the gate driver is in inactive mode. The pattern of the stored values are in pairs of [delay, transistor driver]. The delay is clock cycles until next sync should arrive, and when the sync signals arrives within a given threshold, the transistor driver signal will be output. The storage of the [delay, transistor driver] pairs are implemented as a circular buffer allowing for the system to be running indefinitely as long as the sync signal continuously is detected within valid threshold.

The gate-driver is build around a state machine that can be in four different modes:

- Error: if any error is detected during run, typically from receiving a sync signal to early or to late, this is where the state machine will find itself
- Stopped: default state when the system is initialized, and can be entered when the staye machine is reset from an error
- Armed: when the state machine has been started and waiting for the .first sync pulse to arrive
- Running: when the first sync pulse has been detected and continous detcting sync poulses within valid receiving window

When the system goes out of it reset state, it enters the stopped mode and awaits system events to indicate to start waiting for the first sync pulse, this is also called the ``Armed`` mode. WHen entering the ``Armed`` mode, the number of id value pairs are read from BRAM section and evaluated, if it is indicated that no value pairs are present, i.e. the value is 0, the ``Error`` state is entered. When a valid number of value pairs are detected, the state machine will read out the first value pair and enter the ``Sync_wait`` state and wait for an incoming sync pulse. There is no time-out detection for the first sync pulse, this is to ensure that the TX can be armed before telling the TS to start emitting sync pulses, and the overall system timing for this is unknown. When the first sync pulse has been detected, the state machine keep looping in the ``running`` mode until it is stopped or an error is detected. When looping in the ``running`` mode, value pairs are read out from the BRAM section and is operated as a circular buffer.

At any time, the state machine can be moved into its ``stopped`` mode, though it shall be noted that it typically will result in the statemachine entering the ``error`` state, since the it is not guaranteed that on system level that the sync pulses can stopped from the TS within timing window for when the TX expects the sync pulses to stop.

When reading values out of the BRAM region, it is required to have a wait-state present to ensure a reading from the address setup to valid output available, this wait-states are present when a BRAM region read is performed, as depicted in the state chart below.

.. uml:: ../puml/sc_gate_driver.puml
        :caption: Gate driver stare chart


The waveform generation is depicted in the two following pictures, one for the positive waveform and one for the negative waveform. The waveforms shov the dricing of the A, B, K and damper signals aligned with the sync signal.


.. wavedrom:: ../wavedrom/sync_gen_pos.json
        :caption: Sync signal pos flow


.. wavedrom:: ../wavedrom/sync_gen_neg.json
        :caption: Sync signal neg flow


The reuse of the Gatecon (with modified firmware) makes usage of the A, B, and K signals for generating the resulting waveforms with the following truth table.

= = = === ==== ==== ==== ==== ==== =======
**Input**    **Output**
--------- --------------------------------
A B K     K_Hi R_Hi L_Lo L_Hi R_Lo DampOut
= = = === ==== ==== ==== ==== ==== =======
0 0 0     1    0    0    0    0    0      
0 0 1     0    0    0    0    0    0      
0 1 0     1    1    1    0    0    0      
0 1 1     0    1    1    0    0    0      
1 0 0     1    0    0    1    1    0      
1 0 1     0    0    0    1    1    0      
1 1 0     0    0    0    0    0    1      
1 1 1     0    0    0    0    0    0      
= = = === ==== ==== ==== ==== ==== =======

It shall be noted that this implementation within the Gatecon CPLD maps the usage of the damper through this logical expression ``DampOut = (!A && !B) && K`` and ``K_Hi = (A || B) && K``.
