particle portal ~ ~0.5 ~ 0 0 0 0.5 2
execute positioned ~-4 ~1 ~-4 as @e[type=item,dx=8,dy=2,dz=8,tag=!gm4_ender_hoppers_tp] positioned ~4 ~ ~4 run function ender_hoppers:teleport

execute unless block ~ ~ ~ hopper run function ender_hoppers:destroy
