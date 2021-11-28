# @s = ender hopper (marker or hopper_minecart)
# run from main

particle portal ~ ~ ~ 0 0 0 0.5 2

execute if entity @s[type=marker] if block ~ ~ ~ hopper[enabled=true] positioned ~-4.5 ~0.5 ~-4.5 as @e[type=item,dx=8,dy=2,dz=8,tag=!gm4_ender_hoppers_tp] positioned ~4.5 ~ ~4.5 run function gm4_ender_hoppers:teleport
execute if entity @s[type=hopper_minecart] unless block ~ ~ ~ activator_rail[powered=true] positioned ~-4.5 ~ ~-4.5 as @e[type=item,dx=8,dy=3,dz=8,tag=!gm4_ender_hoppers_tp] positioned ~4.5 ~ ~4.5 run function gm4_ender_hoppers:teleport
