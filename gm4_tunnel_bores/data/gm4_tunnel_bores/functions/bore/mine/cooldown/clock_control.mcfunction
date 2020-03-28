# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:pulse_check on a 1.25Hz pulse

# control slow clock
scoreboard players add slow_clock gm4_bore_data 1
execute if score slow_clock gm4_bore_data matches 3.. run scoreboard players set slow_clock gm4_bore_data 0
