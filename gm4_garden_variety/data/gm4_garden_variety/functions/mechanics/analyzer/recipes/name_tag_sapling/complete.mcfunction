# completes the recipe
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/recipes/name_tag_sapling/analyzing


##### INITIALIZE #####

# get the amount of name tags not used
scoreboard players operation $slot_0_amount_unused gm4_gv_analyzer = $slot_0_amount gm4_gv_analyzer
scoreboard players operation $slot_0_amount_unused gm4_gv_analyzer -= $slot_1_amount gm4_gv_analyzer


##### SLOT MODIFICATIONS #####

# [S0] delete items that are used (name tag)
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get $slot_0_amount_unused gm4_gv_analyzer

# [S1,S2] move items from slot 1 to slot 2 (sapling)
data modify block ~ ~ ~ Items[{Slot:1b}].Slot set value 2b

# [S2] append mutation lore (sapling)
data modify storage gm4_garden_variety:modify/item input set from block ~ ~ ~ Items[{Slot:2b}]
data modify storage gm4_garden_variety:modify/item modifier set from block ~ ~ ~ Items[{Slot:2b}]
function gm4_garden_variety:utility/mutations/lore/apply
data modify block ~ ~ ~ Items[{Slot:2b}] set from storage gm4_garden_variety:modify/item output

# [S2] add name_tag tag (sapling)
data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.name_tag set value 1b


# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete
