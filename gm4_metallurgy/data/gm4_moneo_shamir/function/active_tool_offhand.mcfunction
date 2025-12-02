# @s = players holding a moneo tool
# run from shamir_in_hand

scoreboard players set $tool_current_damage gm4_ml_data 0
scoreboard players set $tool_max_damage gm4_ml_data 0

execute store result score $tool_current_damage gm4_ml_data run data get entity @s equipment.offhand.components."minecraft:damage"
execute store result score $tool_max_damage gm4_ml_data run data get entity @s equipment.offhand.components."minecraft:custom_data".MaxDurability

# activate moneo
execute if score $tool_max_damage gm4_ml_data matches 237 run function gm4_moneo_shamir:tools/shears
