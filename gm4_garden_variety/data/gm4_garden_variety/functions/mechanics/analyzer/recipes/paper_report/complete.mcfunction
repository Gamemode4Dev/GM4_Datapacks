# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items



##### SLOT MODIFICATIONS #####

# [S0,S2] move items from slot 0 to slot 2 (paper)
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 2b

# [S2] append mutation lore (paper)
data modify storage gm4_garden_variety:modify/item input set from block ~ ~ ~ Items[{Slot:2b}]
data modify storage gm4_garden_variety:modify/item modifier set from block ~ ~ ~ Items[{Slot:1b}]
function gm4_garden_variety:data/lore/mutations/apply
data modify block ~ ~ ~ Items[{Slot:2b}] set from storage gm4_garden_variety:modify/item output

# [S2] change item name
data modify block ~ ~ ~ Items[{Slot:2b}].tag.display.Name set value '{"text":"Paper Report","italic":false}'



# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete
