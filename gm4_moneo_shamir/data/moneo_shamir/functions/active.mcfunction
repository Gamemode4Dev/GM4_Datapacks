#run from main
#@s = players holding a moneo tool

tag @s add gm4_has_moneo

scoreboard players set tool_current_damage gm4_ml_data 0
execute store result score tool_current_damage gm4_ml_data run data get entity @s SelectedItem.tag.Damage

scoreboard players set tool_max_damage gm4_ml_data 0
execute store result score tool_max_damage gm4_ml_data run data get entity @s SelectedItem.tag.MaxDurability

execute if score tool_max_damage gm4_ml_data matches 59 run function moneo_shamir:tools/materials/wood
execute if score tool_max_damage gm4_ml_data matches 131 run function moneo_shamir:tools/materials/stone
execute if score tool_max_damage gm4_ml_data matches 250 run function moneo_shamir:tools/materials/iron
execute if score tool_max_damage gm4_ml_data matches 1561 run function moneo_shamir:tools/materials/diamond
execute if score tool_max_damage gm4_ml_data matches 33 run function moneo_shamir:tools/materials/gold
execute if score tool_max_damage gm4_ml_data matches 237 run function moneo_shamir:tools/shears