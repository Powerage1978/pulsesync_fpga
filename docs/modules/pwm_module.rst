----------
PWM module
----------

Functional description
----------------------

The PWM module is a basic PWM module where the base frequency is fixed and the
duty cycle is the only input that can be altered in the range from 0% to 100%,
where 0% equals total off signal and 100% equals constant on.

I/O description
---------------

+----------+-----+-------------+
| Name     | I/O | Type        |
+==========+=====+=============+
| clk      | In  | Logic       |
+----------+-----+-------------+
| rst_n    | In  | Logic       |
+----------+-----+-------------+
| enable   | In  | Logic       |
+----------+-----+-------------+
| pwm_duty | In  | Logic [6:0] |
+----------+-----+-------------+
| pwm_out  | Out | Logic       |
+----------+-----+-------------+

- clk: input clokc signal
- rst_n: active low reset signal, while asserted the pwm_out signal will be kept deasserted
- enable: enables the pwm output
- pwm_duty: sets the pwm duty cycle
- pwm_out: single bit pwm output


Timing diagram
--------------

