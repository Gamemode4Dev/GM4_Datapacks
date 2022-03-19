# run from mobs/initiate
# @s = enderman
# at @s

# calculate stats based on difficulty
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_armor gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_damage gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_speed gm4_ce_data 8

# biome specific modifiers for this mob
execute if predicate gm4_combat_evolved:mobs/modifiers/flowering if predicate gm4_combat_evolved:technical/chance_50 run function gm4_combat_evolved:mobs/biomes/flowering_enderman

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
