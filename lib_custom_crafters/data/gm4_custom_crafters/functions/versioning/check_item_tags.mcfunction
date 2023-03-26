# checks each slot for item tags
# @s = crafter armor stand
# located at the center of the block
# run from gm4_custom_crafters:process_input/check_item via #gm4_custom_crafter:custom_item_checks

execute if score gm4_custom_crafters load.status matches 3 if score gm4_custom_crafters_minor load.status matches 0 run function gm4_custom_crafters:process_input/check_item_tags
