#run from main
#@s = players holding a moneo tool

tag @s add gm4_has_moneo

scoreboard players set tool_current_damage gm4_ml_data 0
execute store result score tool_current_damage gm4_ml_data run data get entity @s SelectedItem.tag.Damage

execute unless score @s gm4_moneo_max matches 0.. run function moneo_shamir:store_maximum

scoreboard players operation tool_max_damage gm4_ml_data = @s gm4_moneo_max
scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score @s gm4_moneo_max matches 59 run function moneo_shamir:tools/materials/wood
execute if score @s gm4_moneo_max matches 131 run function moneo_shamir:tools/materials/stone
execute if score @s gm4_moneo_max matches 250 run function moneo_shamir:tools/materials/iron
execute if score @s gm4_moneo_max matches 1561 run function moneo_shamir:tools/materials/diamond
execute if score @s gm4_moneo_max matches 33 run function moneo_shamir:tools/materials/gold
execute if score @s gm4_moneo_max matches 237 run function moneo_shamir:tools/shears