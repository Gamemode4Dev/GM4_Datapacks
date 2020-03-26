# @s - blast furnace if structure correct
# called by check_ore

execute store result score @s gm4_bf_data run data get block ^ ^ ^1 CookTime
execute if score @s gm4_bf_data matches 183..199 run tag @s add gm4_bf_could_smelt
