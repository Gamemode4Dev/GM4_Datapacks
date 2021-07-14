# @s = marker ray used to detect the sapling
# run from gm4_fruiting_trees:sapling/place_sapling

# check blocks around the marker ray
scoreboard players set $found gm4_count 0
execute store success score $found gm4_count align xyz positioned ~ ~ ~ if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~ ~-1 ~ if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:saplings unless entity @e[type=marker,dx=0,tag=gm4_fruiting_sapling,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_fruiting_sap_location"]}

# move forward
scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless score $found gm4_count matches 1 run function gm4_fruiting_trees:sapling/ray
