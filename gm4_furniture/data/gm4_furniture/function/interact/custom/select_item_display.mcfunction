# selects item display for interacted interaction entity
# @s = furniture's interacted interaction entity 
# at @s
# run from interact/process

# find this furniture's item_display
execute as @e[type=item_display,tag=gm4_furniture.display,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run function gm4_furniture:interact/custom/process
