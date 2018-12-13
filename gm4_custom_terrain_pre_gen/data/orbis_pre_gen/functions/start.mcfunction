scoreboard players operation x gm4_orbis_config = x1 gm4_orbis_config
scoreboard players operation z gm4_orbis_config = z1 gm4_orbis_config

summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_gen_pos]}
execute as @e[type=area_effect_cloud,tag=gm4_orbis_gen_pos,limit=1] run function orbis:set_gen_pos

gamemode spectator @s
tag @a add gm4_orbis_disabled
tag @s remove gm4_orbis_disabled
