execute if score gm4 load.status matches 1 if score gm4_custom_crafters load.status matches 2 if score gm4_machines load.status matches 1 run scoreboard players set gm4_tunnel_bores load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tunnel Bores",require:"Gamemode 4"}
execute unless score gm4_custom_crafters load.status matches 2 run data modify storage gm4:log queue append value {type:"missing",module:"Tunnel Bores",require:"Custom Crafters"}
execute unless score gm4_machines load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Tunnel Bores",require:"lib_machines"}

execute if score gm4_tunnel_bores load.status matches 1 run function gm4_tunnel_bores:init
execute unless score gm4_tunnel_bores load.status matches 1 run schedule clear gm4_tunnel_bores:pulse_check
