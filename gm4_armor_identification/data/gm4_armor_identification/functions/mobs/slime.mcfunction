# run from mobs/initiate
# @s = slime / magma cube
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 8.. if predicate gm4_armor_identification:technical/chance_5 run data modify entity @s Size set value 4
execute if score $difficulty gm4_ai_data matches 11.. if predicate gm4_armor_identification:technical/chance_15 run data modify entity @s Size set value 4
execute if score $difficulty gm4_ai_data matches 11.. if predicate gm4_armor_identification:technical/chance_5 run data modify entity @s Size set value 5

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/flowering run tag @s add gm4_ai_growing_slime
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run tag @s[type=slime] add gm4_ai_poison_landing

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
