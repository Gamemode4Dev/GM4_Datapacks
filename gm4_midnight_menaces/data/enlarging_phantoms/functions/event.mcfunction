#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

#summon potential spawn points
summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:CustomName:"\"gm4_phantom_spawn_point\"",Tags:["gm4_phantom_spawn_point"],Duration:18000,Radius:0.01,Particle:"block air"}

#randomizer, kill some spawn points
execute store result score phantom_random_value gm4_menace run data get entity @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point,limit=1] UUIDMost 0.00000000002273064325381162890625
scoreboard players operation phantom_random_value gm4_menace %= 100 gm4_menace
execute if score phantom_random_value gm4_menace matches ..96 run kill @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point,limit=1]

execute store result score phantom_random_value gm4_menace run data get entity @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point,limit=1] UUIDMost 0.00000000002273064325381162890625
scoreboard players operation phantom_random_value gm4_menace %= 17 gm4_menace

#calculate required value (periodic over time)
scoreboard players operation phantom_required_value gm4_menace = daytime gm4_nights_data
scoreboard players operation phantom_required_value gm4_menace %= 17 gm4_nights_data

#compare values, if big enough, summon phantom
execute if score phantom_random_value gm4_menace >= phantom_required_value gm4_menace if entity @p run function enlarging_phantoms:set_pos

#kill spawn points
kill @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point]

#reset scores
scoreboard players reset phantom_required_value gm4_menace
scoreboard players reset phantom_random_value gm4_menace
