# extracts binding_curse from the tool
# @s = armor stand display (we need the hand)
# located at the enchantment extractor block
# run from enchantment_extractors:extract_item

execute store result score $added_curse gm4_ench_data run loot insert ~ ~ ~ fish gm4_enchantment_extractors:technical/extract/binding_curse ~ ~ ~ mainhand
scoreboard players set $extracted_curse gm4_ench_data 1
execute unless score $added_curse gm4_ench_data matches 0 run scoreboard players add $added_books gm4_ench_data 1
