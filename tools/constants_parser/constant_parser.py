"""
file1 = open("../tmp/airvisor_config.py")
 
# Reading from file
print(file1.read())
 
file1.close()
"""

import ast

def parse_dict() -> None:
    settings_HM = {
        "preamp_gains": [21,21,1,1,1,1],
        "coil_areas": [5,5,1,1,1,1],
        "base_period": 1000,
        "kickin": 25,
        "hm_ontime": 250,
        "kickout": 25,
        "hm_frontgate_delay": 5,
        "transistor_delay": 1,
        "gatewidth_limit_time": 0,
        "gatewidth_limit_value": 0.2,
        "t_lin": 2,
        "gates_pr_decade_on": 3,
        "gates_pr_decade_off": 10,
        "sig_gen" : False,
        "pulse_sync" : True,
        "pulse_sync_damping_setuptime" : 1
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

    print(f"kickin_clks:\t\t {int(kickin_clks)},\t {int(kickin_clks):#x}")
    print(f"on_top_clks:\t\t {int(on_top_clks)},\t {int(on_top_clks):#x}")
    print(f"time_to_damper_clks:\t {int(time_to_damper_clks)},\t {int(time_to_damper_clks):#x}")
    print(f"from_damp_to_next_clks:\t {int(from_damp_to_next_clks)},\t {int(from_damp_to_next_clks):#x}")


def parse_dict_test(data_dict: dict) -> None:
    T_TOLERANCE = 24 #must be even for symmetric tolerance. Update in HW if changed!
    clk1_ppm = 0 #Measure correct value and set T_TOLERANCE. Or, better, update state-machine to scaled. For now, disable clock precision check!
    clk2_ppm = 0
    N_STAGES = 3 #number of clock domain crossing stages in hw.
    count_offset = 5 #HW state machine dependent fixed offset.
    tx_pulsesync_freq = 50 #MHz

    kickin_usec = data_dict.get('kickin')
    hm_ontime_usec = data_dict.get('hm_ontime')
    pulse_sync_damping_setuptime = data_dict.get('pulse_sync_damping_setuptime')
    kickout_usec = data_dict.get('kickout')
    base_period_usec = data_dict.get('base_period')

    on_top_time_usec = hm_ontime_usec - kickin_usec
    time_to_damper_usec = kickout_usec - pulse_sync_damping_setuptime

    kickin_clks = tx_pulsesync_freq * kickin_usec - count_offset + T_TOLERANCE/2
    on_top_clks = tx_pulsesync_freq * on_top_time_usec - count_offset + T_TOLERANCE/2
    time_to_damper_clks = tx_pulsesync_freq * time_to_damper_usec - count_offset + T_TOLERANCE/2
    from_damp_to_next_clks = tx_pulsesync_freq * (base_period_usec - (hm_ontime_usec + time_to_damper_usec)) - count_offset + T_TOLERANCE/2

    print(f"kickin_clks:\t\t {int(kickin_clks)},\t {int(kickin_clks):#x}")
    print(f"on_top_clks:\t\t {int(on_top_clks)},\t {int(on_top_clks):#x}")
    print(f"time_to_damper_clks:\t {int(time_to_damper_clks)},\t {int(time_to_damper_clks):#x}")
    print(f"from_damp_to_next_clks:\t {int(from_damp_to_next_clks)},\t {int(from_damp_to_next_clks):#x}")


def parse_file():
    lines = []
    dict_data = ""
    found_entry = False
    with open("../tmp/test.py") as data:
        for line in data:
            lines.append(line.strip())

    for line in lines:
        if (found_entry):
            dict_data += line
            if('}' in line):
                found_entry = False
        if('settings_HM' in line):
            dict_data += '{'
            found_entry = True
        
    resulting_dict = ast.literal_eval(dict_data)
    parse_dict_test(resulting_dict)
    

def main():
    parse_dict()
    parse_file()

if __name__ == "__main__":
    main()
