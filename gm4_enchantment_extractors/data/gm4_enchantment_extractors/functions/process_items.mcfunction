# processes each item in the enchantment extractor
# @s = armor stand display (we need the hand)
# located at the enchantment extractor block
# run from extract

# run for last item in storage
data modify storage gm4_enchantment_extractors:temp current_item set from storage gm4_enchantment_extractors:temp items[0]

# check if the item has enchantments
execute store result score $has_enchantments gm4_ench_data run data get storage gm4_enchantment_extractors:temp current_item.tag.Enchantments
# if there is only one enchantment, check that it is not a visual enchant (lvl:0s)
execute if score $has_enchantments gm4_ench_data matches 1 store result score $has_enchantments gm4_ench_data run data get storage gm4_enchantment_extractors:temp current_item.tag.Enchantments[-1].lvl

# extract enchantments if there is room in the dropper inventory
execute if score $has_enchantments gm4_ench_data matches 1.. if score $slot_count gm4_ench_data matches ..8 run function gm4_enchantment_extractors:extract_item

# run for next item in storage unless the inventory is full
data remove storage gm4_enchantment_extractors:temp current_item
data remove storage gm4_enchantment_extractors:temp items[0]
execute if score $slot_count gm4_ench_data matches ..8 if data storage gm4_enchantment_extractors:temp items[-1] run function gm4_enchantment_extractors:process_items
