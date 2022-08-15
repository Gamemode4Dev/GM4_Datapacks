# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_armor gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_damage gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 3
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_speed gm4_ce_data 8

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance/replace_enderman run function gm4_combat_expanded:mob/effect/flowering_enderman
execute if predicate gm4_combat_expanded:mob/modifier/the_end run scoreboard players add $mob_stats gm4_ce_data 4

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
