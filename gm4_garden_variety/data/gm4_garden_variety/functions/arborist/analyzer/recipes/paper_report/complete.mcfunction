# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# finalize
function gm4_garden_variety:arborist/analyzer/recipes/complete



##### SLOT MODIFICATIONS #####

### slot 0 ### (paper)
# move items from slot 0 to slot 2 (paper)
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 2b

### slot 2 ### (paper)
# delete all lore
data remove block ~ ~ ~ Items[{Slot:2b}].tag.display.Lore
# append trait lore
function gm4_garden_variety:data/lore/traits/apply/to_analyzer_output
data modify block ~ ~ ~ Items[{Slot:2b}].tag.display.Lore append from storage gm4_garden_variety:data/modify Item.tag.display.Lore
# add used tag
data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.analyzer.used set value 1b


