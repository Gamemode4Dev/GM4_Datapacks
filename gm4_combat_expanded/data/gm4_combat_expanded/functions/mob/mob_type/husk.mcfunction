# calculate modifiers for newly spawned husk
# @s = husk
# at @s
# run from mob/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -4 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -2 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.04 multiply_base

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_armor gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_toughness gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_speed gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_damage gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_toughness gm4_ce_data 2

# quadruple armor drop rate at diff 11 or above
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s ArmorDropChances set value [0.34F,0.34F,0.34F,0.34F]

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_toughness gm4_ce_data 4
attribute @s[predicate=gm4_combat_expanded:mob/modifier/dark] zombie.spawn_reinforcements modifier add 88708a3a-b8f0-46f8-8dd9-1f8fb0f315d6 "gm4_ce_modifier_dark" 0.25 multiply_base
tag @s[predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
execute if entity @s[predicate=gm4_combat_expanded:mob/modifier/burned] run function gm4_combat_expanded:mob/effect/burned_husk
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run function gm4_combat_expanded:mob/effect/mountain_zombie
execute if predicate gm4_combat_expanded:mob/modifier/flowering run tag @s add gm4_ce_spore_zombie
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_weakness_attacks
execute if predicate gm4_combat_expanded:mob/modifier/growth run function gm4_combat_expanded:mob/effect/growth_zombie

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic
execute if entity @s[tag=gm4_ce_spore_zombie] run function gm4_combat_expanded:mob/effect/flowering_zombie
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/generic

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# remove bonus damage if weapon is held, then set droprate to 20% (unless in "Dark")
execute if data entity @s HandItems[{Count:1b}] run scoreboard players set $mob_damage gm4_ce_data 0
execute if score $mob_damage gm4_ce_data matches 0 run data modify entity @s[predicate=!gm4_combat_expanded:mob/modifier/dark] HandDropChances set value [0.20F,0.20F]

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
