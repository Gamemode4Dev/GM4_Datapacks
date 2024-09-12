# destroy furniture if it loses its required connection to the wall / ceiling
# @s = furniture's main interaction entity
# at @s
# run from main

scoreboard players set $creative gm4_furniture_data 0
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
function gm4_furniture:break/destroy
