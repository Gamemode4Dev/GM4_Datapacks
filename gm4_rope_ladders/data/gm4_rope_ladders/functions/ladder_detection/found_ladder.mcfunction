
scoreboard players set $ray gm4_rol_data -999

execute unless entity @e[type=wandering_trader,tag=gm4_rol_rcd_ladder,dx=0] run function gm4_rope_ladders:ladder_detection/spawn_rcd
