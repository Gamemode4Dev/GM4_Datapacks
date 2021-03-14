# @s = none
# at world spawn
# called by event

# summon potential spawn points
summon minecraft:area_effect_cloud 29999998 1 7134 {CustomName:'"gm4_phantom_spawn_point"',Tags:["gm4_phantom_spawn_point"],Duration:1,Radius:0f,Particle:"block air"}

# randomizer (average spawn rate: 1 every 40 seconds)
execute store result score phantom_random_value gm4_menace_data run data get entity @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point,limit=1] UUID[0]
scoreboard players operation phantom_random_value gm4_menace_data %= 100 gm4_menace_data
execute if score phantom_random_value gm4_menace_data matches 50.. if entity @a[limit=1] run function gm4_enlarging_phantoms:set_pos

# kill spawn points
kill @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point]

# reset scores
scoreboard players reset phantom_random_value gm4_menace_data

# loop every 20 seconds
execute if score enlarging_phantoms gm4_menace_data matches 1 run schedule function gm4_enlarging_phantoms:slow_clock 20s
