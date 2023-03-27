# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/initiate

# base stat nerf
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -2 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.04 multiply_base

# calculate stats based on difficulty
scoreboard players operation $mob_damage gm4_ce_data += $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_speed gm4_ce_data 4
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_damage gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_toughness gm4_ce_data 5

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
