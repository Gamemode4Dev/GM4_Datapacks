# checks the item for enchantments, and inserts loot accordingly
# @s = armor stand display (we need the hand)
# located at the enchantment extractor block
# run from #gm4_enchantment_extractors:extract_enchantment via gm4_enchantment_extractors:extract_item

loot insert ~ ~ ~ fish gm4_enchantment_extractors:technical/extract/check ~ ~ ~ mainhand
