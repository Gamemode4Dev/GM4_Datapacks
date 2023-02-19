# checks each slot for item tags
# @s = crafter armor stand
# located at the center of the block
# run from gm4_custom_crafters-3.0:process_input/check_item_tags via #gm4_custom_crafters:custom_item_checks

execute if predicate gm4_hotswap_hotbars:custom_item_tags/shulker_boxes run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.gm4_hotswap_hotbars.shulker_boxes set value 1b
