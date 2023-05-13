# update the weapon damage tooltip and name when it is upgraded to netherite
# @s = player wielding the weapon
# at @s
# run from weapon/process

# set weapon to be converted
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.netherite set value 1

# add damage from netherite
execute store result score $damage gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_ce_base_attack_damage"}].Amount 10
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_ce_base_attack_damage"}].Amount double 0.1 run scoreboard players add $damage gm4_ce_data 10

# add sharpness damage for lore
execute store result score $sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl
scoreboard players operation $sharpness gm4_ce_data *= #5 gm4_ce_data
execute if score $sharpness gm4_ce_data matches 1.. run scoreboard players add $sharpness gm4_ce_data 5
scoreboard players operation $damage gm4_ce_data += $sharpness gm4_ce_data

# get digits seperate
scoreboard players operation $damage_10 gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $damage_01 gm4_ce_data = $damage gm4_ce_data
scoreboard players operation $damage_01 gm4_ce_data %= #10 gm4_ce_data

# check if text should be light green
execute store result score $damage_buffed gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.damage_buffed

# get new lore lines
# slots 0 is reserved for the weapon, slot 1 is reserved for the modifier
loot replace block 29999998 1 7134 container.2 loot gm4_combat_expanded:technical/sharpness_lore

# update lore with lib_lore
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"gray","translate":"item.modifiers.mainhand"}'
scoreboard players set $start gm4_lore 1
function #gm4_lore:remove
data modify storage gm4_lore:temp Input set from block 29999998 1 7134 Items[{Slot:2b}].tag.display.Lore
function #gm4_lore:insert
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source

# update item
item modify entity @s weapon.mainhand gm4_combat_expanded:update
