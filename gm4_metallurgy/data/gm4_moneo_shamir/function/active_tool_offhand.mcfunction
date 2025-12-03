# @s = players holding a moneo tool
# at @s
# run from shamir_in_hand

scoreboard players set $tool_current_damage gm4_ml_data 0
scoreboard players set $tool_max_damage gm4_ml_data 0

execute store result score $tool_current_damage gm4_ml_data run data get entity @s equipment.offhand.components."minecraft:damage"
execute store result score $tool_max_damage gm4_ml_data run data get entity @s equipment.offhand.components."minecraft:custom_data".MaxDurability

# update newly upgraded netherite gear
execute if score $tool_max_damage gm4_ml_data matches 1561 if predicate gm4_moneo_shamir:holding_netherite_offhand run function gm4_moneo_shamir:update_netherite_offhand

# activate moneo
execute if score $tool_max_damage gm4_ml_data matches 59 run function gm4_moneo_shamir:tools/materials/wood
execute if score $tool_max_damage gm4_ml_data matches 131 run function gm4_moneo_shamir:tools/materials/stone
execute if score $tool_max_damage gm4_ml_data matches 190 run function gm4_moneo_shamir:tools/materials/copper
execute if score $tool_max_damage gm4_ml_data matches 250 run function gm4_moneo_shamir:tools/materials/iron
execute if score $tool_max_damage gm4_ml_data matches 1561 run function gm4_moneo_shamir:tools/materials/diamond
execute if score $tool_max_damage gm4_ml_data matches 2031 run function gm4_moneo_shamir:tools/materials/netherite
# | gold used to be listed as 33 max damage, this is kept for compatibility with old items
execute if score $tool_max_damage gm4_ml_data matches 32..33 run function gm4_moneo_shamir:tools/materials/gold
execute if score $tool_max_damage gm4_ml_data matches 237 run function gm4_moneo_shamir:tools/shears
