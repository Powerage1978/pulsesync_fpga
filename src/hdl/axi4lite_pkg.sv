`timescale 1ns / 1ps
package axi4lite_pkg;
    parameter C_LOG2_BUFFER_SIZE        = 5;
    parameter C_DATA_WIDTH              = 32;
    parameter C_ADDR_WIDTH              = C_LOG2_BUFFER_SIZE + 3;		/*!< lower two bits defines byte access (not used) */
    parameter C_ADDR_LSB                = 2; 						    /*!< equals 32 bit addressing, 3 equals 64 bit */
    parameter C_RAM_DEPTH               = 2 ** C_LOG2_BUFFER_SIZE;
    parameter C_OPT_MEM_ADDR_BITS       = 1;

    // Control word used by PWM generator
    parameter C_PWM_CTRL_RUN_OFFSET     = 0;
    parameter C_PWM_CTRL_RUN_SIZE       = 1;
    parameter C_DCDC_ENA_OFFSET         = 1;
    parameter C_DCDC_ENA_SIZE           = 1;
    parameter C_PWM_CTRL_DUTY_OFFSET    = 25;
    parameter C_PWM_CTRL_DUTY_SIZE      = 7;
endpackage