# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# finalize
function gm4_garden_variety:arborist/analyzer/recipes/complete

# get the amount of name tags not used
scoreboard players operation $slot_0_amount_unused gm4_gv_analyze = $slot_0_amount gm4_gv_analyze
scoreboard players operation $slot_0_amount_unused gm4_gv_analyze -= $slot_1_amount gm4_gv_analyze



##### SLOT MODIFICATIONS #####


# [S0] delete items that are used (name tag)
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get $slot_0_amount_unused gm4_gv_analyze

# [S1,S2] move items from slot 1 to slot 2 (sapling)
data modify block ~ ~ ~ Items[{Slot:1b}].Slot set value 2b

# [S2] append trait lore (sapling)
data remove storage gm4_garden_variety:data/garden_variety nbt
data modify storage gm4_garden_variety:data/garden_variety nbt set from block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety
function gm4_garden_variety:data/lore/traits/apply/to_analyzer_output

# [S2] add name_tag tag (sapling)
data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.name_tag set value 1b
