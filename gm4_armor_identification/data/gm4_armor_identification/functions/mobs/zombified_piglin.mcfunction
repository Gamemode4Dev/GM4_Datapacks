# run from mobs/initiate
# @s = zombified piglin
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 8.. run scoreboard players add $mob_health gm4_ai_data 4
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_health gm4_ai_data 2
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_damage gm4_ai_data 5
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_armor gm4_ai_data 5
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_toughness gm4_ai_data 1

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
