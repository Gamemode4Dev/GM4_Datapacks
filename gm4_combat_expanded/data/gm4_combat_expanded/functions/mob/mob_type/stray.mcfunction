# calculate modifiers for newly spawned stray
# @s = stray
# at @s
# run from mob/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -8 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.08 multiply_base

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_toughness gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 8.. store success score $arrow gm4_ce_data run loot replace entity @s[predicate=gm4_combat_expanded:technical/chance/skeleton_harming_arrow,predicate=!gm4_combat_expanded:mob/modifier/growth] weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_harming

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_speed gm4_ce_data 2
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_toughness gm4_ce_data 2
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run scoreboard players add $mob_toughness gm4_ce_data 5
execute if predicate gm4_combat_expanded:mob/modifier/snowy unless predicate gm4_combat_expanded:mob/modifier/growth store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_snowy
execute if predicate gm4_combat_expanded:mob/modifier/toxic unless predicate gm4_combat_expanded:mob/modifier/growth store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/stray_toxic
execute if predicate gm4_combat_expanded:mob/modifier/growth run function gm4_combat_expanded:mob/effect/growth_skeleton
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance/replace_skeleton run function gm4_combat_expanded:mob/effect/flowering_skeleton

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/skeleton

# arrow drop rate
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# half droprate of armor in "Dark"
data modify entity @s[predicate=gm4_combat_expanded:mob/modifier/dark] ArmorDropChances set value [0.0452F,0.0452F,0.0452F,0.0452F]

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
