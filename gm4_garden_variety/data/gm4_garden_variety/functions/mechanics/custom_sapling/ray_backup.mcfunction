# @s = marker ray used to detect the sapling
# run from gm4_fruiting_trees:sapling/place_sapling

# check blocks around the marker ray
scoreboard players set $found gm4_gv_gen_data 0
execute store success score $found gm4_gv_gen_data align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}
execute if score $found gm4_gv_gen_data matches 0 store success score $found gm4_gv_gen_data align xyz positioned ~0.5 ~1.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}
execute if score $found gm4_gv_gen_data matches 0 store success score $found gm4_gv_gen_data align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}
execute if score $found gm4_gv_gen_data matches 0 store success score $found gm4_gv_gen_data align xyz positioned ~1.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}
execute if score $found gm4_gv_gen_data matches 0 store success score $found gm4_gv_gen_data align xyz positioned ~-0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}
execute if score $found gm4_gv_gen_data matches 0 store success score $found gm4_gv_gen_data align xyz positioned ~0.5 ~0.5 ~1.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}
execute if score $found gm4_gv_gen_data matches 0 store success score $found gm4_gv_gen_data align xyz positioned ~0.5 ~0.5 ~-0.5 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,distance=..0.1,tag=gm4_gv_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}

# move forward
scoreboard players remove $ray gm4_gv_gen_data 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_gv_gen_data matches 0..500 at @s unless score $found gm4_gv_gen_data matches 1 run function gm4_garden_variety:mechanics/custom_sapling/ray_backup
