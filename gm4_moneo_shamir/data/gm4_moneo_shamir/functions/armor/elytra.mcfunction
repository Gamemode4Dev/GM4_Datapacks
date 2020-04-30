# run from active_armor_chest
# @s = player wearing the moneo elytra

scoreboard players operation tool_max_damage gm4_ml_data -= tool_current_damage gm4_ml_data

execute if score tool_max_damage gm4_ml_data matches 10..20 run effect give @s minecraft:slowness 2 1
execute if score tool_max_damage gm4_ml_data matches 2..20 at @s run playsound minecraft:entity.bat.takeoff master @s ~ ~ ~ 5 1.65
execute if score tool_max_damage gm4_ml_data matches 2..9 run effect give @s minecraft:slowness 2 2