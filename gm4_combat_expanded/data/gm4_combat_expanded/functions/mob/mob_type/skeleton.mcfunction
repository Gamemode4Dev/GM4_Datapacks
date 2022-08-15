# calculate modifiers for newly spawned skeleton
# @s = skeleton
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_toughness gm4_ce_data 1
execute if score $difficulty gm4_ce_data matches 8.. store success score $arrow gm4_ce_data run loot replace entity @s[predicate=gm4_combat_expanded:technical/chance/skeleton_harming_arrow,predicate=!gm4_combat_expanded:mob/modifier/growth] weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/skeleton_harming

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ce_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/dark run scoreboard players add $mob_speed gm4_ce_data 2
execute if predicate gm4_combat_expanded:mob/modifier/toxic unless predicate gm4_combat_expanded:mob/modifier/growth store success score $arrow gm4_ce_data run loot replace entity @s weapon.offhand loot gm4_combat_expanded:mob/equip_arrow/skeleton_toxic
item replace entity @s[predicate=gm4_combat_expanded:mob/modifier/growth] weapon.mainhand with air

# set armor
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_combat_expanded:mob/equip_weapon/skeleton

# drop rate for custom arrows
execute if score $arrow gm4_ce_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
