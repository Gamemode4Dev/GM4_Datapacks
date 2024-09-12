# process custom furniture interactions
# @s = furniture's interacted interaction entity 
# at @s
# run from interact/process

# find this furniture's item_display and store its furniture_id
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=item_display,tag=gm4_furniture.display,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id run data modify storage gm4_furniture:temp furniture_id set from entity @s item.components."minecraft:custom_data".gm4_furniture.furniture_id
# resolve function call
function gm4_furniture:interact/custom/resolve_function with storage gm4_furniture:temp
data remove storage gm4_furniture:temp furniture_id
