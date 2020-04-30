# init module scoreboards
scoreboard objectives add gm4_bore_data dummy
scoreboard players set trigger_tick gm4_bore_data 0
scoreboard players set #-1 gm4_bore_data -1

function gm4_tunnel_bores:bore/mine/cooldown/calculate_clock_timings

scoreboard objectives add gm4_bore_fuel dummy
scoreboard players set #3600 gm4_bore_fuel 3600
scoreboard objectives add gm4_bore_rail dummy

# base

execute unless score tunnel_bores gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Tunnel Bores"}
scoreboard players set tunnel_bores gm4_modules 1

schedule function gm4_tunnel_bores:pulse_check 10t

#$moduleUpdateList
