# starts processing items in the enchantment extractor
# @s = armor stand display (we need the hand)
# located at the enchantment extractor block
# run from process

# set up storage and armor stand
data modify storage gm4_enchantment_extractors:temp items set from block ~ ~ ~ Items
execute store result score $slot_count gm4_ench_data run data get storage gm4_enchantment_extractors:temp items

# loop through all items
function gm4_enchantment_extractors:process_items

# clean up
data remove storage gm4_enchantment_extractors:temp items
