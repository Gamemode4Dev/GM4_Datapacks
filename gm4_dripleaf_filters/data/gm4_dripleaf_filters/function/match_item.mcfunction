# Loops through all slots in the hopper that contain items and checks if they match the item on the leaf
# @s = item on a dripleaf
# at @s aligned xz
# run from gm4_dripleaf_filters:check_hopper_filter and itself

execute store success score $items_are_different gm4_dripleaf_filters run data modify storage gm4_dripleaf_filters:cache whitelisted_items[0].id set from storage gm4_dripleaf_filters:cache compare_id
execute if score $items_are_different gm4_dripleaf_filters matches 1 run data remove storage gm4_dripleaf_filters:cache whitelisted_items[0]
execute if score $items_are_different gm4_dripleaf_filters matches 1 if data storage gm4_dripleaf_filters:cache whitelisted_items[0] run function gm4_dripleaf_filters:match_item
