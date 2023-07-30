/*
 * Memory map and register definitions
 */

package mem_map_pkg;
    // Pulsesync control word
    parameter C_CONTROL_ADDR                = 0;
    parameter C_CONTROL_RUN_OFFSET          = 0;
    parameter C_CONTROL_RUN_SIZE            = 2;

    parameter C_CTRL_RUN                    = 2'b01;
    parameter C_CTRL_RESET                  = 2'b10;
    parameter C_CTRL_STOP                   = 2'b11;

    // Pulsesync Status word
    parameter C_STATUS_ADDR                 = 1;
    parameter C_STATUS_RUN_MODE_OFFSET      = 0;
    parameter C_STATUS_RUN_MODE_SIZE        = 3;

    parameter C_STATUS_RUN_MODE_STOPPED     = 3'b00;
    parameter C_STATUS_RUN_MODE_ARMED       = 3'b01;
    parameter C_STATUS_RUN_MODE_RUNNING     = 3'b10;
    parameter C_STATUS_RUN_MODE_ERR         = 3'b11;
    
    // Generator control word
    parameter C_GEN_CTRL_ADDR               = 2;
    parameter C_GEN_CTRL_RUN_OFFSET         = 0;
    parameter C_GEN_CTRL_RUN_SIZE           = 2;

    parameter C_GEN_CTRL_START              = 2'b01;
    parameter C_GEN_CTRL_STOP               = 2'b10;

    // Generator status word
    parameter C_GEN_STATUS_ADDR             = 3;
    parameter C_GEN_STATUS_RUN_MODE_OFFSET  = 0;
    parameter C_GEN_STATUS_RUN_MODE_SIZE    = 2;

    parameter C_GEN_STATUS_RUN_MODE_STOPPED = 2'b00;
    parameter C_GEN_STATUS_RUN_MODE_RUNNING = 2'b01;
        

    // DCDC PWM control words
    parameter C_PWM_CTRL_ADDR               = 10;
    parameter C_PWM_CTRL_I_RUN_OFFSET       = 0;
    parameter C_PWM_CTRL_V_RUN_OFFSET       = 2;
    parameter C_PWM_CTRL_RUN_SIZE           = 2;

    parameter C_PWM_CTRL_START              = 2'b01;
    parameter C_PWM_CTRL_STOP               = 2'b10;

    // DCDC PWM status words
    parameter C_PWM_STATUS_ADDR             = 11;
    parameter C_PWM_STATUS_I_INFO_OFFSET    = 0;
    parameter C_PWM_STATUS_V_INFO_OFFSET    = 2;
    parameter C_PWM_STATUS_DCDC_INFO_OFFSET = 4;
    parameter C_PWM_STATUS_INFO_SIZE        = 2;
    

    parameter C_PWM_STATUS_STOPPED          = 2'b00;
    parameter C_PWM_STATUS_RUNNING          = 2'b01;
    parameter C_PWM_STATUS_ERROR            = 2'b10;

    parameter C_DCDC_STATUS_STOPPED         = 2'b00;
    parameter C_DCDC_STATUS_RUNNING         = 2'b01;
    parameter C_DCDC_STATUS_ERROR           = 2'b10;

    // DCDC PWM value word
    parameter C_PWM_VAL_ADDR                = 12;
    parameter C_PWM_VAL_IDLE_I_DUTY_OFFSET  = 0;
    parameter C_PWM_VAL_RUN_I_DUTY_OFFSET   = 8;
    parameter C_PWM_VAL_IDLE_V_DUTY_OFFSET  = 16;
    parameter C_PWM_VAL_RUN_V_DUTY_OFFSET   = 24;
    parameter C_PWM_VAL_DUTY_SIZE           = 8;

    // Version word
    parameter C_VERSION_ADDR                = 30;

    // Dummy test word
    parameter C_DUMMY_ADDR                  = 31;

    // BRAM Ctl word 0
    parameter C_NO_OF_ID_SIZE                = 4;
    parameter C_NO_OF_ID_OFFSET              = 0;

    // BRAM Ctl word 1
    // N/A

endpackage
