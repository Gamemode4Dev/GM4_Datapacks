# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# get the amount of name tags not used
scoreboard players operation $slot_0_amount_unused gm4_gv_analyze = $slot_0_amount gm4_gv_analyze
scoreboard players operation $slot_0_amount_unused gm4_gv_analyze -= $slot_1_amount gm4_gv_analyze



##### SLOT MODIFICATIONS #####


# [S0] delete items that are used (name tag)
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get $slot_0_amount_unused gm4_gv_analyze

# [S1,S2] move items from slot 1 to slot 2 (sapling)
data modify block ~ ~ ~ Items[{Slot:1b}].Slot set value 2b

# [S2] append mutation lore (sapling)
data modify storage gm4_garden_variety:modify/item input set from block ~ ~ ~ Items[{Slot:2b}]
data modify storage gm4_garden_variety:modify/item modifier set from block ~ ~ ~ Items[{Slot:2b}]
function gm4_garden_variety:data/lore/mutations/apply
data modify block ~ ~ ~ Items[{Slot:2b}] set from storage gm4_garden_variety:modify/item output

# [S2] add name_tag tag (sapling)
data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.name_tag set value 1b



# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete