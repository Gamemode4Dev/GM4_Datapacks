# @s = furnace_minecart
# at world spawn
# called by gm4_tunnel_bores:pulse_check

# handle cart orientation and environment (rail interactions, cart push direction) on 5Hz
execute if score main_clock gm4_bore_data = trigger_tick gm4_bore_data if entity @s[tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/tunnel_bore_5hz
execute if score main_clock gm4_bore_data = 5hz_pulse_1 gm4_bore_data if entity @s[tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/tunnel_bore_5hz
execute if score main_clock gm4_bore_data = 5hz_pulse_2 gm4_bore_data if entity @s[tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/tunnel_bore_5hz
execute if score main_clock gm4_bore_data = 5hz_pulse_3 gm4_bore_data if entity @s[tag=gm4_tunnel_bore] run function gm4_tunnel_bores:bore/tunnel_bore_5hz
