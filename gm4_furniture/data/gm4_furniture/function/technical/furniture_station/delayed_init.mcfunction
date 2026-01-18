# select villagers that need to be teleported down into position
# @s = unspecified
# at unspecified
# scheduled from technical/furniture_station/init_villager

execute as @e[type=villager,tag=gm4_furniture.tp_down] at @s run function gm4_furniture:technical/furniture_station/delayed_tp
