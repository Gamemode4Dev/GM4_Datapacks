# process custom furniture interactions
# @s = interacted furniture's item display
# at @s
# run from interact/custom/select_item_display

# find this furniture's item_display and store its furniture_id
data modify storage gm4_furniture:temp furniture_id set from entity @s item.components."minecraft:custom_data".gm4_furniture.furniture_id
# resolve function call
function gm4_furniture:interact/custom/resolve_function with storage gm4_furniture:temp
data remove storage gm4_furniture:temp furniture_id
