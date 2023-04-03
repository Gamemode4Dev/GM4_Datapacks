# multiplies items by their specific multiplier
# @s = crafters containing a recipe result
# located at @s
# run from gm4_custom_crafters:process_input/attempt_craft

# apply multiplier for all items
data modify storage gm4_custom_crafters:temp/output Items set from block ~ ~ ~ Items
function gm4_custom_crafters:process_output/apply_multiplier
# insert multiplied items into block
data modify block ~ ~ ~ Items set from storage gm4_custom_crafters:temp/output NewItems

# store current contents
data modify entity @s data.gm4_custom_crafters.cached_output set from block ~ ~ ~ Items
tag @s add gm4_custom_crafters_crafted

# clean up
data remove storage gm4_custom_crafters:temp/output NewItems
data remove storage gm4_custom_crafters:temp/output Items
