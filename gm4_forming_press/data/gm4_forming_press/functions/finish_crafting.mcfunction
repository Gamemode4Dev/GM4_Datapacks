# multiplies items by their specific multiplier
# @s = crafters containing a recipe result
# located at @s
# run from gm4_forming_press:recipe_validity_check

# apply multiplier for all items
data modify storage gm4_forming_press:temp/output Items set from block ~ ~ ~ Items
function gm4_forming_press:apply_multiplier
# insert multiplied items into block
data modify block ~ ~ ~ Items set from storage gm4_forming_press:temp/output NewItems

# clean up
data remove storage gm4_forming_press:temp/output NewItems
