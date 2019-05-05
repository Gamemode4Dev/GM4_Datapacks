summon area_effect_cloud ~ ~ ~ {Tags:["trapped_signs_ray"]}
tp @e[tag=trapped_signs_ray] ~ ~1.7 ~ ~ ~
scoreboard players set ray_counter gm4_count 0
execute as @e[tag=trapped_signs_ray] at @s run function trapped_signs:ray
execute at @e[tag=trapped_signs_ray] align xyz positioned ~0.5 ~0.5 ~0.5 run function trapped_signs:create
