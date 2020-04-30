# no @s
# at world spawn
# called by gm4_tunnel_bores:init

# figure out tick values in a 5 tick intervall for 5Hz clock
scoreboard players operation 5hz_pulse_1 gm4_bore_data = trigger_tick gm4_bore_data
scoreboard players add 5hz_pulse_1 gm4_bore_data 4

scoreboard players operation 5hz_pulse_2 gm4_bore_data = 5hz_pulse_1 gm4_bore_data
scoreboard players add 5hz_pulse_2 gm4_bore_data 4

scoreboard players operation 5hz_pulse_3 gm4_bore_data = 5hz_pulse_2 gm4_bore_data
scoreboard players add 5hz_pulse_3 gm4_bore_data 4
