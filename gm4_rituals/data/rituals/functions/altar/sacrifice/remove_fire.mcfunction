#removes fire on tagged entities
#@s - console
#scheduled by rituals:altar/sacrifice/global_functions

#remove fire
execute at @e[tag=gm4_rit_remove_fire] if block ~ ~ ~ minecraft:fire run setblock ~ ~ ~ minecraft:air

#remove tag
tag @e[tag=gm4_rit_remove_fire] remove gm4_rit_remove_fire
