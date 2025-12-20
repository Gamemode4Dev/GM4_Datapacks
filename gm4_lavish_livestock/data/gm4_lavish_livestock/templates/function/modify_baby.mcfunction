# Sets the size of the newborn baby
# @s = the newborn baby
# at location of breeding site marker
# run from gm4_lavish_livestock:{{ entity_id }}/find_baby

# get baby size from marker value
scoreboard players operation @s gm4_lavish_livestock_size = $size gm4_lavish_livestock_size

# if non-vanilla size: add loot table and tag entity (tag is for future-proofing only, it is not currently read)
execute if score @s gm4_lavish_livestock_size matches 1.. run tag @s add gm4_lavish_livestock_{{ entity_id }}
execute if score @s gm4_lavish_livestock_size matches 1.. run data modify entity @s DeathLootTable set value "gm4_lavish_livestock:{{ entity_id }}/lavish_death"

# set scale attribute
execute if score @s gm4_lavish_livestock_size matches 1 run attribute @s minecraft:scale modifier add gm4_lavish_livestock:size 0.125 add_multiplied_base
execute if score @s gm4_lavish_livestock_size matches 2 run attribute @s minecraft:scale modifier add gm4_lavish_livestock:size 0.25 add_multiplied_base
