# checks each slot for item tags
# @s = crafter armor stand
# located at the center of the block
# run from gm4_forming_press:check_item via #gm4_forming_press:custom_item_checks

execute if score gm4_forming_press load.status matches 1 if score gm4_forming_press_minor load.status matches 1.. run function gm4_forming_press:check_item_tags
