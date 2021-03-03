#run from main
#@s = players holding a moneo tool

scoreboard players set tool_current_damage gm4_ml_data 0
scoreboard players set tool_max_damage gm4_ml_data 0

execute store result score tool_current_damage gm4_ml_data run data get entity @s SelectedItem.tag.Damage
execute store result score tool_max_damage gm4_ml_data run data get entity @s SelectedItem.tag.MaxDurability

# update newly upgraded netherite gear
execute if score tool_max_damage gm4_ml_data matches 1561 if predicate gm4_moneo_shamir:holding_netherite run function gm4_moneo_shamir:update_netherite

# activate moneo
execute if score tool_max_damage gm4_ml_data matches 59 run function gm4_moneo_shamir:tools/materials/wood
execute if score tool_max_damage gm4_ml_data matches 131 run function gm4_moneo_shamir:tools/materials/stone
execute if score tool_max_damage gm4_ml_data matches 250 run function gm4_moneo_shamir:tools/materials/iron
execute if score tool_max_damage gm4_ml_data matches 1561 run function gm4_moneo_shamir:tools/materials/diamond
execute if score tool_max_damage gm4_ml_data matches 2031 run function gm4_moneo_shamir:tools/materials/netherite
execute if score tool_max_damage gm4_ml_data matches 33 run function gm4_moneo_shamir:tools/materials/gold
execute if score tool_max_damage gm4_ml_data matches 237 run function gm4_moneo_shamir:tools/shears
