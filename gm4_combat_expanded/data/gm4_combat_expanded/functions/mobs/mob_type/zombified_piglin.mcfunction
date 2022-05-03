# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mobs/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_health gm4_ce_data 4
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_health gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_damage gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_toughness gm4_ce_data 1

# set modifiers
function gm4_combat_expanded:mobs/modifiers/prep
