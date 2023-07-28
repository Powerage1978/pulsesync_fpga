Memory map
==========

The mapping of registers used for controlling the system and reading back status is memory mapped to the base address of 0x43C00000. Each register is a 32 bit register. The address listed in the table below are the word register address, but read and writes on those registers are byte aligned, thus a write to a specific register must be performed at the absolute address of 0x43C00000 + (``Word Address`` << 2), i.e. the version register shall be read from address: 0x43C00000 + (0x1E << 2) = 0x43C00078.

The memory map is divided into two sections, one generic section where all the memory mapped registers reside (the lower 32 words) and one section where the pulsesync delay/gatedrive pairs reside (upper 32 words). The section of delay/gatedrive pairs are intended to be written as one coherent block in one large chunk, where the first two values are control words, used for defining the total number of delay/gatedrive pairs present.

.. tabularcolumns:: \Yl{0.2}|\Yl{0.2}

.. list-table:: Memory map overview
   :header-rows: 1
   :widths: 1 1

   * - **Register**
     - **Address**
   * - Gate driver ctrl
     - 0x00
   * - Gate driver status
     - 0x01
   * - Generator ctrl 
     - 0x02
   * - Generator status
     - 0x03
   * - PWM ctrl
     - 0x0A
   * - PWM status
     - 0x0B
   * - PWM value
     - 0x0C
   * - Version
     - 0x1E
   * - Dummy
     - 0x1F
   * - BRAM - Ctrl0
     - 0x20
   * - BRAM - Ctrl1 
     - 0x21
   * - BRAM - Delay0
     - 0x22
   * - BRAM - Value0
     - 0x23
   * - ...
     - ...
   * - BRAM - Delay14
     - 0x3E
   * - BRAM - Value14
     - 0x3F

Registers
---------

Gate driver ctrl
^^^^^^^^^^^^^^^^

The gate driver control register is used to start the pulsesync gatedriver . stop and reset

.. wavedrom:: ./wavedrom/gatedriver/control_reg.json
   :caption: Gate driver control reg

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}
.. list-table:: Gate driver control reg bit definitions
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-2
     - | Unimplemented
   * - | 1-0
     - | 00 = Reserved
       | 01 = Enable gate driver
       | 10 = Stop gate driver
       | 11 = Reset gate driver

.. raw:: latex
   
   \newpage


Gate driver status
^^^^^^^^^^^^^^^^^^

The gate driver status reg

.. wavedrom:: ./wavedrom/gatedriver/status_reg.json
   :caption: Gate driver status reg

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: Gate driver status reg bit definitions
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-3
     - | Unimplemented
   * - | 2-0
     - | 000 = Reserved
       | 001 = Armed
       | 010 = Running
       | 011 = Stopped
       | 100 = Error
       | 101 = Unused
       | 110 = Unused
       | 111 = Unused

.. raw:: latex
   
   \newpage

Generator ctrl
^^^^^^^^^^^^^^

.. wavedrom:: ./wavedrom/generator_status_reg.json
   :caption: Generator status register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: Generator status reg bit definitions
   :widths: 1 2
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

.. wavedrom:: ./wavedrom/generator_ctrl_reg.json
   :caption: Generator control register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: Generator control reg bit definitions
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-2
     - | Unimplemented
   * - | 1-0
     - | 00 = Reserved
       | 01 = Stopped
       | 10 = Running
       | 11 = Unused

.. raw:: latex
   
   \newpage

DCDC PWM ctrl
^^^^^^^^^^^^^

The PWM control reg

.. wavedrom:: ./wavedrom/pwm_control.json
   :caption: PWM control register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: DCDC PWM control reg bit definitions
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-4
     - | Unimplemented
   * - | 3-2
     - | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Unused
   * - | 1-0
     - | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Unused

.. raw:: latex
   
   \newpage

DCDC PWM status
^^^^^^^^^^^^^^^

The PWM status reg 

.. wavedrom:: ./wavedrom/pwm_status.json
   :caption: PWM status register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: DCDC PWM status reg bit definitions
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-4
     - | Unimplemented
   * - | 3-2
     - | V info
       | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Error
   * - | 1-0
     - | I info
       | 00 = Reserved
       | 01 = Start
       | 10 = Stop
       | 11 = Error

.. raw:: latex
   
   \newpage

DCDC PWM value
^^^^^^^^^^^^^^

All four pwm values are the duty cycle in percent ranging from 0% to 100%. The register can be set at any time during operation, and the values will be loaded into the pwm at runtime when the current pwm duty cycle is restarted.

.. wavedrom:: ./wavedrom/pwm_value.json
   :caption: PWM value register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: DCDC PWM value reg bit definitions
   :widths: 1 2
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

The version reg

.. raw:: latex
   
   \newpage

Dummy
^^^^^

A dummy variabel that is read only and can be used to validate if the memory section can be accessed by user space. It contains the value `0xDEADBEEF`.

.. raw:: latex
   
   \newpage

BRAM ctrl0
^^^^^^^^^^

.. wavedrom:: ./wavedrom/bram_ctrl0.json
   :caption: BRAM ctrl0 register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: BRAM ctrl0 register bit definitions
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-4
     - | Unimplemented
   * - | 3-0
     - | Number of ids stored in BRAM region

.. raw:: latex
   
   \newpage


BRAM ctrl1
^^^^^^^^^^

N/A

.. raw:: latex
   
   \newpage

BRAM delay value[X]
^^^^^^^^^^^^^^^^^^^

.. wavedrom:: ./wavedrom/bram_delay.json
   :caption: BRAM delay value[X] register

.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: BRAM region delay register[X]
   :widths: 1 2
   :header-rows: 1

   * - **Bit**
     - **Definition**
   * - | 31-0
     - | Delay value in clock cycles


.. raw:: latex
   
   \newpage


BRAM gatedrive value[X]
^^^^^^^^^^^^^^^^^^^^^^^

.. wavedrom:: ./wavedrom/bram_gatedrive.json
   :caption: BRAM gatedrive value[X] register


.. tabularcolumns:: \Yl{0.2}|\Yl{0.4}

.. list-table:: BRAM region gatedrive value register[X]
   :widths: 1 2
   :header-rows: 1
   
   * - **Bit**
     - **Definition**
   * - | 31-0
     - | Gatedrive value bit pattern


