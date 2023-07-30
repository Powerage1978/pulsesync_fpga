Memory map
==========

The mapping of registers used for controlling the system and reading back status is memory mapped to the base address of 0x43C00000. Each register is a 32 bit register. The address listed in the table below are the word register address, but read and writes on those registers are byte aligned, thus a write to a specific register must be performed at the absolute address of 0x43C00000 + (``Word Address`` << 2), i.e. the version register shall be read from address: 0x43C00000 + (0x1E << 2) = 0x43C00078.

The memory map is divided into two sections, one generic section where all the memory mapped registers reside (the lower 32 words) and one section where the pulsesync delay/gatedrive pairs reside (upper 32 words). The section of delay/gatedrive pairs are intended to be written as one coherent block in one large chunk, where the first two values are control words, used for defining the total number of delay/gatedrive pairs present.

.. tabularcolumns:: \Yl{0.2}|\Yl{0.2}

.. list-table:: Memory map overview
   :header-rows: 1

   * - **Register**
     - **Address**
   * - Gatedriver control
     - 0x00
   * - Gatedriver status
     - 0x01
   * - Generator control 
     - 0x02
   * - Generator status
     - 0x03
   * - PWM control
     - 0x0A
   * - PWM status
     - 0x0B
   * - PWM value
     - 0x0C
   * - Version
     - 0x1E
   * - Dummy
     - 0x1F
   * - BRAM - Control0
     - 0x20
   * - BRAM - Control1
     - 0x21
   * - BRAM - Delay0
     - 0x22
   * - BRAM - Gatedrive value0
     - 0x23
   * - ...
     - ...
   * - BRAM - Delay14
     - 0x3E
   * - BRAM - Gatedrive value14
     - 0x3F

Registers
---------

Gatedriver control
^^^^^^^^^^^^^^^^^^

The gatedriver control register is used to enable/start, stop and reset the pulsesync gatedriver. The pulsesync module can require a reset if the received sync pulses from the TS get out of sync with required timing.

.. wavedrom:: ./wavedrom/gatedriver_control_reg.json
   :caption: Gatedriver control reg

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}
.. list-table:: Gatedriver control register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-2
     - | Unimplemented
   * - | 1-0
     - | 00 = Reserved
       | 01 = Enable gatedriver
       | 10 = Stop gatedriver
       | 11 = Reset gatedriver

.. raw:: latex
   
   \newpage


Gatedriver status
^^^^^^^^^^^^^^^^^

The gatedriver status register reads back the current operating mode.

.. wavedrom:: ./wavedrom/gatedriver_status_reg.json
   :caption: Gatedriver status register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: Gatedriver status register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-2
     - | Unimplemented
   * - | 1-0
     - | 00 = Stopped
       | 01 = Armed
       | 10 = Running
       | 11 = Error

.. raw:: latex
   
   \newpage

Generator control
^^^^^^^^^^^^^^^^^
The generator control register is used for controlling the build-in generator, for starting and stopping its operation.

.. wavedrom:: ./wavedrom/generator_status_reg.json
   :caption: Generator status register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: Generator status register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-2
     - | Unimplemented
   * - | 1-0
     - | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Unused

.. raw:: latex
   
   \newpage

Generator status
^^^^^^^^^^^^^^^^

The generator status register is used for reading back the current operation status of the generator.

.. wavedrom:: ./wavedrom/generator_status_reg.json
   :caption: Generator status register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: Generator status register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-2
     - | Unimplemented
   * - | 1-0
     - | 00 = Stopped
       | 01 = Running
       | 10 = Unused
       | 11 = Unused

.. raw:: latex
   
   \newpage

DCDC PWM ctrl
^^^^^^^^^^^^^

The DCDC PWM control register is used to start and stop the PWMs controlling the current and voltage on the external hardware DCDC module. Each PWM can be started and stopped individually.

.. wavedrom:: ./wavedrom/pwm_control.json
   :caption: PWM control register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: DCDC PWM control register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-4
     - | Unimplemented
   * - | 3-2
     - | *PWM voltage control*
       | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Unused
   * - | 1-0
     - | *PWM current control*
       | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Unused

.. raw:: latex
   
   \newpage

DCDC PWM status
^^^^^^^^^^^^^^^

The DCDC PWM status register 

.. wavedrom:: ./wavedrom/pwm_status.json
   :caption: PWM status register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: DCDC PWM status register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-6
     - | Unimplemented
   * - | 5-4
     - | *DCDC status*
       | 00 = Stopped
       | 01 = Running
       | 10 = Error
       | 11 = Unused
   * - | 3-2
     - | *Voltage PWM status*
       | 00 = Stopped
       | 01 = Running
       | 10 = Error
       | 11 = Unused
   * - | 1-0
     - | *Current PWM status*
       | 00 = Stopped
       | 01 = Running
       | 10 = Error
       | 11 = Unused

.. raw:: latex
   
   \newpage

DCDC PWM value
^^^^^^^^^^^^^^

All four pwm values are the duty cycle in percent ranging from 0% to 100%. The register can be set at any time during operation, and the values will be loaded into the pwm at runtime when the current pwm duty cycle is restarted.

.. wavedrom:: ./wavedrom/pwm_value.json
   :caption: PWM value register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: DCDC PWM value register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-24
     - | I control run mode PWM duty cycle
   * - | 23-16
     - | I control idle mode PWM duty cycle
   * - | 15-8
     - | V control run mode PWM duty cycle
   * - | 7-0
     - | V control idle mode PWM duty cycle

.. raw:: latex
   
   \newpage

Version
^^^^^^^

The version register is used for reading back the current version of the bitstream. *Currently not holding a valid value*.

.. raw:: latex
   
   \newpage

Dummy
^^^^^

A dummy variable that is read only and can be used to validate if the memory section can be accessed by user space. It contains the value `0xDEADBEEF`.

.. raw:: latex
   
   \newpage

BRAM control0
^^^^^^^^^^^^^

The BRAM control0 register holds the number of index containing valid values in the BRAM region, used by the gatedriver module during its operation. When the gatedriver is started, this value is read and uses it to operate the whole BRAM region as a circular buffer, for reading out delay/gatedrive value pairs.

.. wavedrom:: ./wavedrom/bram_ctrl0.json
   :caption: BRAM control0 register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: BRAM control0 register bit definitions
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-4
     - | Unimplemented
   * - | 3-0
     - | Number of indexes holding valid delay/gatedriver values in BRAM region

.. raw:: latex
   
   \newpage


BRAM control1
^^^^^^^^^^^^^

N/A

.. raw:: latex
   
   \newpage

BRAM delay value[X]
^^^^^^^^^^^^^^^^^^^

One part of the delay/gatedrive value pair. This holds the delay value in clock cycles, until the next sync pulse shall arrive from the TS.

.. wavedrom:: ./wavedrom/bram_delay.json
   :caption: BRAM delay value[X] register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: BRAM region delay register[X]
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-25
     - | Unused
   * - | 24-0
     - | Delay value in clock cycles


.. raw:: latex
   
   \newpage


BRAM gatedrive value[X]
^^^^^^^^^^^^^^^^^^^^^^^

The gatedrive value, that shall be used directly driving the Gatecon circuit.

.. wavedrom:: ./wavedrom/bram_gatedrive.json
   :caption: BRAM gatedrive value[X] register


.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: BRAM region gatedrive value register[X]
   :header-rows: 1
   
   * - **Bit**
     - **Definition**
   * - | 31-4
     - | Unused
   * - | 3-0
     - | Gatedrive value bit pattern


