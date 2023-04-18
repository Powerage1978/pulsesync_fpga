import ast

def parse_dict() -> None:

    settings_HM = {
        "preamp_gains": [21,21,1,1,1,1],
        "coil_areas": [5,5,1,1,1,1],
        "base_period": 1538.4,
        "kickin": 11,
        "hm_ontime": 400,
        "kickout": 15,
        "hm_frontgate_delay": 5,
        "transistor_delay": 1.5,
        "gatewidth_limit_time": 0,
        "gatewidth_limit_value": 0.2,
        "t_lin": 0.5,
        "gates_pr_decade_on": 3,
        "gates_pr_decade_off": 12,
        "sig_gen" : False,
        "pulse_sync" : True,
        "pulse_sync_damping_setuptime" : 3
    }

    T_TOLERANCE = 24 #must be even for symmetric tolerance. Update in HW if changed!
    clk1_ppm = 0 #Measure correct value and set T_TOLERANCE. Or, better, update state-machine to scaled. For now, disable clock precision check!
    clk2_ppm = 0
    N_STAGES = 3 #number of clock domain crossing stages in hw.
    count_offset = 5 #HW state machine dependent fixed offset.

    tx_pulsesync_freq = 50 #MHz
    kickin_usec = settings_HM.get('kickin')                 # self.kickin_usec
    hm_ontime_usec = settings_HM.get('hm_ontime')           # self.hm_ontime_usec

    pulse_sync_damping_setuptime = settings_HM.get('pulse_sync_damping_setuptime')
    kickout_usec = settings_HM.get('kickout')

    on_top_time_usec = hm_ontime_usec - kickin_usec
    time_to_damper_usec = kickout_usec - pulse_sync_damping_setuptime
    base_period_usec = settings_HM.get('base_period')

    kickin_clks = tx_pulsesync_freq * kickin_usec - count_offset + T_TOLERANCE/2
    on_top_clks = tx_pulsesync_freq * on_top_time_usec - count_offset + T_TOLERANCE/2
    time_to_damper_clks = tx_pulsesync_freq * time_to_damper_usec - count_offset + T_TOLERANCE/2
    from_damp_to_next_clks = tx_pulsesync_freq * (base_period_usec - (hm_ontime_usec + time_to_damper_usec)) - count_offset + T_TOLERANCE/2


    test_str = format('{:#010x}'.format(12))
    kickin_clks_str = format('{:#010x}'.format(int(kickin_clks))).replace('0x','h')
    kickin_clks_sim_str = format('{:#010x}'.format(int(kickin_clks - 55))).replace('0x','h')
    on_top_clks_str = format('{:#010x}'.format(int(on_top_clks))).replace('0x','h')
    on_top_clks_sim_str = format('{:#010x}'.format(int(on_top_clks - 55))).replace('0x','h')
    time_to_damper_clks_str = format('{:#010x}'.format(int(time_to_damper_clks))).replace('0x','h')
    time_to_damper_clks_sim_str = format('{:#010x}'.format(int(time_to_damper_clks - 55))).replace('0x','h')
    from_damp_to_next_clks_str = format('{:#010x}'.format(int(from_damp_to_next_clks))).replace('0x','h')
    from_damp_to_next_clks_sim_str = format('{:#010x}'.format(int(from_damp_to_next_clks - 55))).replace('0x','h')
    print(f"Data: {kickin_clks_str}")

    print(f"***** PARSE DICT ********")
    print(f"kickin_clks:\t\t {int(kickin_clks)},\t {int(kickin_clks):#x}")
    print(f"on_top_clks:\t\t {int(on_top_clks)},\t {int(on_top_clks):#x}")
    print(f"time_to_damper_clks:\t {int(time_to_damper_clks)},\t {int(time_to_damper_clks):#x}")
    print(f"from_damp_to_next_clks:\t {int(from_damp_to_next_clks)},\t {int(from_damp_to_next_clks):#x}")
    print(f"*************")
    print(f"// Base_period: " + str(base_period_usec))
    print(f"// hm_ontime: " + str(hm_ontime_usec))
    print(f"// Kickin: " + str(kickin_usec))
    print(f"// Kickout: " + str(kickout_usec))
    print(f"// pulse_sync_damping_setuptime: " + str(pulse_sync_damping_setuptime))
    print(f"ram_state_settings[0]  = 32'" + from_damp_to_next_clks_str + ';')
    print(f"ram_state_settings[1]  = 32'h00000015" + ';' + '\t// A, K, DCDC')
    print(f"ram_state_settings[2]  = 32'" + kickin_clks_str + ';')
    print(f"ram_state_settings[3]  = 32'h00000011" + ';' + '\t// A, DCDC')
    print(f"ram_state_settings[4]  = 32'" + on_top_clks_str + ';')
    print(f"ram_state_settings[5]  = 32'h00000010" + ';' + '\t// DCDC')
    print(f"ram_state_settings[6]  = 32'" + time_to_damper_clks_str + ';')
    print(f"ram_state_settings[7]  = 32'h00000014" + ';' + '\t// Damper, DCDC')
    print(f"ram_state_settings[8]  = 32'" + from_damp_to_next_clks_str + ';')
    print(f"ram_state_settings[9]  = 32'h00000016" + ';' + '\t// B, K, DCDC')
    print(f"ram_state_settings[10] = 32'" + kickin_clks_str + ';')
    print(f"ram_state_settings[11] = 32'h00000012" + ';' + '\t// B, DCDC')
    print(f"ram_state_settings[12] = 32'" + on_top_clks_str + ';')
    print(f"ram_state_settings[13] = 32'h00000010" + ';' + '\t// DCDC')
    print(f"ram_state_settings[14] = 32'" + time_to_damper_clks_str + ';')
    print(f"ram_state_settings[15] = 32'h00000014" + ';' + '\t// Damper, DCDC')
    print(f"*************")
    print(f"**** Test generator settings ****")
    print(f"sync_delay_settings[0]  = 32'" + kickin_clks_sim_str + ';')
    print(f"sync_delay_settings[1]  = 32'" + on_top_clks_sim_str + ';')
    print(f"sync_delay_settings[2]  = 32'" + time_to_damper_clks_sim_str + ';')    
    print(f"sync_delay_settings[3]  = 32'" + from_damp_to_next_clks_sim_str + ';')
    print(f"sync_delay_settings[4]  = 32'" + kickin_clks_sim_str + ';')
    print(f"sync_delay_settings[5]  = 32'" + on_top_clks_sim_str + ';')
    print(f"sync_delay_settings[6]  = 32'" + time_to_damper_clks_sim_str + ';')
    print(f"sync_delay_settings[7]  = 32'" + from_damp_to_next_clks_sim_str + ';')
    print(f"*************")
   

def main():
    parse_dict()

if __name__ == "__main__":
    main()
