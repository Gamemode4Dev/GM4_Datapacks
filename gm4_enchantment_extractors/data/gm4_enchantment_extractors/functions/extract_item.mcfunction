# extracts enchantments from this item
# @s = armor stand display (we need the hand)
# located at the enchantment extractor block
# run from process_items

data modify entity @s HandItems[0] set from storage gm4_enchantment_extractors:temp current_item

# check if mending already in extractor
data modify storage gm4_enchantment_extractors:temp block_items set from block ~ ~ ~ Items
execute store result score $existing_mending gm4_ench_data if data storage gm4_enchantment_extractors:temp block_items[{tag:{StoredEnchantments:[{id:"minecraft:mending"}]}}]

# if cursed extract only the curse
execute if data storage gm4_enchantment_extractors:temp current_item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function gm4_enchantment_extractors:extract_vanishing
execute if data storage gm4_enchantment_extractors:temp current_item.tag.Enchantments[{id:"minecraft:binding_curse"}] run function gm4_enchantment_extractors:extract_binding

# extract
execute unless score $curse_extracted gm4_ench_data matches 1 store result score $added_books gm4_ench_data run loot insert ~ ~ ~ fish gm4_enchantment_extractors:technical/extract/check ~ ~ ~ mainhand

# visuals
playsound block.enchantment_table.use block @a[distance=..5] ~ ~ ~ 1 0.8
playsound block.grindstone.use block @a[distance=..5] ~ ~ ~ .6 0.8
particle enchant ~ ~1.3 ~ 0 0 0 .5 10

# failed extraction
execute unless score $added_books gm4_ench_data matches 1.. run function gm4_enchantment_extractors:extract_failed

# update block inventory
scoreboard players operation $slot_count gm4_ench_data += $added_books gm4_ench_data
data remove storage gm4_enchantment_extractors:temp current_item.tag.Enchantments
data modify block ~ ~ ~ Items append from storage gm4_enchantment_extractors:temp current_item

# grant mending advancement
data modify storage gm4_enchantment_extractors:temp block_items set from block ~ ~ ~ Items
execute unless score $existing_mending gm4_ench_data matches 1.. if data storage gm4_enchantment_extractors:temp block_items[{tag:{StoredEnchantments:[{id:"minecraft:mending"}]}}] unless data storage gm4_enchantment_extractors:temp block_items[{tag:{StoredEnchantments:[{id:"minecraft:mending"},{id:"minecraft:vanishing_curse"}]}}] run advancement grant @a[distance=..5] only gm4:enchantment_extractors_mending

# clean up
data remove entity @s HandItems[0]
data remove storage gm4_enchantment_extractors:temp block_items
scoreboard players reset $existing_mending gm4_ench_data
scoreboard players reset $curse_extracted gm4_ench_data
scoreboard players reset $added_books gm4_ench_data
