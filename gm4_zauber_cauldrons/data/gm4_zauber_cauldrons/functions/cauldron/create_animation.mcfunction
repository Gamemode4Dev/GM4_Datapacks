# @s = server
# scheduled from gm4_zauber_cauldron:cauldron/create

execute if score creation_counter gm4_zc_data matches ..40 run schedule function gm4_zauber_cauldrons:cauldron/create_animation 1t
scoreboard players add creation_counter gm4_zc_data 1

execute as @e[type=area_effect_cloud,tag=gm4_zc_creation_animation] at @s run teleport @s ^0.15 ^ ^0.025 facing entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,distance=..1,limit=1]
execute at @e[type=area_effect_cloud,tag=gm4_zc_creation_animation] run particle minecraft:enchant ~ ~0.6 ~ 0 0 0 0.001 1
