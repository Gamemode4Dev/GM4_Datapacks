# @s = players wearing armor with moneo
# run from shamir_equipped

scoreboard players set $tool_current_damage gm4_ml_data 0
scoreboard players set $tool_max_damage gm4_ml_data 0

execute store result score $tool_current_damage gm4_ml_data run data get entity @s Inventory[{Slot:102b}].tag.Damage
execute store result score $tool_max_damage gm4_ml_data run data get entity @s Inventory[{Slot:102b}].tag.MaxDurability

execute if score $tool_max_damage gm4_ml_data matches 432 run function gm4_moneo_shamir:armor/elytra
