# @s = beehive that is ready to produce and has more than 0 bees
# at @s
# run from ambrosia:hive/find_flowers

# place loot
tag @s add gm4_no_bowls
execute if block ~ ~ ~ barrel{Items:[{id:"minecraft:bowl",Count:1b}]} run tag @s remove gm4_no_bowls
execute as @s[tag=!gm4_no_bowls] run function gm4_ambrosia:hive/fill_bowl
execute as @s[tag=gm4_no_bowls] run loot insert ~ ~ ~ loot gm4_ambrosia:hive_loot

# spawn display bee
execute if entity @a[distance=..32,limit=1] run function gm4_ambrosia:beehavior/spawn_roaming_bee
