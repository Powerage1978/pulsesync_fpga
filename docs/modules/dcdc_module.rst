------------
DC-DC module
------------

Functional description
----------------------

The DC-DC module implements the control of the voltage and current pwm signals and enable signal for the physical DC-DC module. It defines the startup behaviour of the PWM signals from  default diel setting to required setpoint regulation.

I/O description
---------------

============ === ============
Name         I/O Type
============ === ============
clk          In  Logic
rst_n        In  Logic
curr_control In  Logic [31:0]
volt_control In  Logic [31:0]
mode         In  Logic
pwm_out_curr Out Logic
pwm_out_volt Out Logic
ena_psu      Out Logic
============ === ============

- clk: 
- rst_n: active low reset signal
- curr_control: 
- volt_control: 
- mode: 
- pwm_out_curr: 
- pwm_out_volt: 
- ena_psu: 

.. wavedrom:: ../wavedrom/pwm_control.json
  :caption: Control reg

- run_duty: run pwm duty cycle
- idle_duty: idle pwm duty cycle
- en: Enable signal for the PWM

Timing diagram
--------------