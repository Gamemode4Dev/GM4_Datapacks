# update the weapon damage tooltip when sharpness level changes or when it gets identified
# @s = player wielding the weapon / weapon item
# at @s
# run from weapon/process
# run from identification/weapon/pick_mod

# store actual sharpness level in storage
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.sharpness short 1 run scoreboard players get $current_sharpness gm4_ce_data

# check if text should be light green
execute store result score $damage_buffed gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.damage_buffed

# get weapon damage and added damage from sharpness (0.5 * level + 0.5)
execute store result score $damage gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_base_attack_damage"}].amount 10
scoreboard players operation $current_sharpness gm4_ce_data *= #5 gm4_ce_data
execute if score $current_sharpness gm4_ce_data matches 1.. run scoreboard players add $current_sharpness gm4_ce_data 5
scoreboard players operation $damage gm4_ce_data += $current_sharpness gm4_ce_data

# get digits seperate
scoreboard players operation $damage_10 gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_01 gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage_01 gm4_ce_data %= #10 gm4_ce_data

# get new lore lines
# slots 0 is reserved for the weapon, slot 1 is reserved for the modifier
loot replace block 29999998 1 7134 container.2 loot gm4_combat_expanded:technical/sharpness_lore

# update lore with lib_lore
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","italic":false,"translate":"item.modifiers.mainhand"}'
scoreboard players set $start gm4_lore 1
function #gm4_lore:remove
data modify storage gm4_lore:temp Input set from block 29999998 1 7134 Items[{Slot:2b}].components."minecraft:lore"
function #gm4_lore:insert
data modify storage gm4_combat_expanded:temp components."minecraft:lore" set from storage gm4_lore:temp Source

# update item if held by player, otherwise the function that called this will handle it
execute unless entity @s[type=player] run return 0
data modify storage gm4_combat_expanded:temp sharpness.lore set from storage gm4_combat_expanded:temp components."minecraft:lore"
function gm4_combat_expanded:item_modify_eval/sharpness_lore with storage gm4_combat_expanded:temp sharpness
data remove storage gm4_combat_expanded:temp sharpness

function gm4_combat_expanded:item_modify_eval/mainhand_update with storage gm4_combat_expanded:temp
