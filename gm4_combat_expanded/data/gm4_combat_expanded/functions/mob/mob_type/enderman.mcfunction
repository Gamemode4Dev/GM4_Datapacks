# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -4 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -2 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.04 multiply_base

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
