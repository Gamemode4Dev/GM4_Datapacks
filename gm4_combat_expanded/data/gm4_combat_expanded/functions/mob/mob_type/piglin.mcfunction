# calculate modifiers for newly spawned piglin
# @s = piglin
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

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/piglin

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# remove bonus damage if weapon is held, then set droprate to 20% (unless in "Dark")
execute if data entity @s HandItems[{Count:1b}] run scoreboard players set $mob_damage gm4_ce_data 0
execute if score $mob_damage gm4_ce_data matches 0 run data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
