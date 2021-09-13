# completes the recipe
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/recipes/book_report/analyzing


##### SLOT MODIFICATIONS #####

# [S0,S2] move items from slot 0 to slot 2 (book)
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 2b

# [S2] append mutation lore (book)
data modify storage gm4_garden_variety:modify/item input set from block ~ ~ ~ Items[{Slot:2b}]
data modify storage gm4_garden_variety:modify/item modifier set from block ~ ~ ~ Items[{Slot:1b}]
function gm4_garden_variety:utility/mutations/lore/apply
data modify block ~ ~ ~ Items[{Slot:2b}] set from storage gm4_garden_variety:modify/item output

# [S2] change item name
data modify block ~ ~ ~ Items[{Slot:2b}].tag.display.Name set value '{"text":"Book Report","italic":false}'



# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete
