# destroy furniture from any interaction, targeting the main interaction
# @s = furniture's interaction interaction entity
# at @s
# run from main

scoreboard players set $creative gm4_furniture_data 0
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=interaction,tag=gm4_furniture.main,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run function gm4_furniture:break/destroy
