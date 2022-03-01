# run from mobs/initiate
# @s = skeleton
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players add $mob_toughness gm4_ai_data 1
execute if score $difficulty gm4_ai_data matches 8.. if predicate gm4_armor_identification:technical/chance_15 store success score $arrow gm4_ai_data run loot replace entity @s weapon.offhand loot gm4_armor_identification:mobs/equip_arrow/skeleton_harming

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ai_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/dark run scoreboard players add $mob_speed gm4_ai_data 2
execute if predicate gm4_armor_identification:mobs/modifiers/toxic store success score $arrow gm4_ai_data run loot replace entity @s weapon.offhand loot gm4_armor_identification:mobs/equip_arrow/skeleton_toxic
execute if predicate gm4_armor_identification:mobs/modifiers/growth run item replace entity @s weapon.mainhand with air

# set armor
loot replace entity @s armor.feet loot gm4_armor_identification:mobs/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_armor_identification:mobs/equip_weapon/skeleton

# drop rate for custom arrows
execute if score $arrow gm4_ai_data matches 1 run data modify entity @s HandDropChances[1] set value 0.25F

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
