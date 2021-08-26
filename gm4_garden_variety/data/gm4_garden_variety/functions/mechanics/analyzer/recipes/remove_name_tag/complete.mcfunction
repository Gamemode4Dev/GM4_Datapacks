# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# get durability of first slot + slot 1 amount
execute store result score $slot_0_durability gm4_gv_analyze run data get block ~ ~ ~ Items[{Slot:0b}].tag.Damage
scoreboard players operation $slot_0_durability gm4_gv_analyze += $slot_1_amount gm4_gv_analyze



##### SLOT MODIFICATIONS #####

# [S0] remove durability base on item count in slot 1 (shears)
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Damage int 1 run scoreboard players get $slot_0_durability gm4_gv_analyze

# [S1] remove lore (sapling)
function gm4_garden_variety:data/lore/mutations/remove/from_analyzer_sapling

# [S1] remove name_tag tag (sapling)
data remove block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety.name_tag

# [S2] set slot 2 item (name tag)
item replace block ~ ~ ~ container.2 with minecraft:name_tag

# [S2] set correct amount
execute store result block ~ ~ ~ Items[{Slot:2b}].Count int 1 run scoreboard players get $slot_1_amount gm4_gv_analyze

# [S2] append mutation lore (name tag)
data modify storage gm4_garden_variety:data/garden_variety_nbt convert set from block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety
function gm4_garden_variety:data/lore/mutations/apply/to_analyzer_output



# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete
