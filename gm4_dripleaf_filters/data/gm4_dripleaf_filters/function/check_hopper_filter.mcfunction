# Checks if the item matches any of the items in the hopper
# @s item on a dripleaf
# at @s aligned xz
# run from gm4_dripleaf_filters:on_leaf

# store the item's ID in storage
data modify storage gm4_dripleaf_filters:cache compare_id set from entity @s Item.id
# store the hopper's items in storage
data modify storage gm4_dripleaf_filters:cache whitelisted_items set from block ^ ^-1 ^1 Items

# loop through the slots to see if any IDs match
function gm4_dripleaf_filters:match_item

execute if score $items_are_different gm4_dripleaf_filters matches 0 run function gm4_dripleaf_filters:deposit_item
