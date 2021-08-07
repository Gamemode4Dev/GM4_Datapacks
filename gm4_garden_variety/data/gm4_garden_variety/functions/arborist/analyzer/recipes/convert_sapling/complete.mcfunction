# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# finalize
function gm4_garden_variety:arborist/analyzer/recipes/complete

# get the amount of bone meal not used
scoreboard players operation $slot_0_amount_unused gm4_gv_analyze = $slot_0_amount gm4_gv_analyze
scoreboard players operation $slot_0_amount_unused gm4_gv_analyze -= $slot_1_amount gm4_gv_analyze



##### SLOT MODIFICATIONS #####


# [S0] delete items that are used (name tag)
execute store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get $slot_0_amount_unused gm4_gv_analyze

# [S1] convert sapling to wild version
execute if data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:oak_sapling"}] run loot replace block ~ ~ ~ container.1 loot gm4_natural_trees:items/sapling/wild_oak
execute if data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:birch_sapling"}] run loot replace block ~ ~ ~ container.1 loot gm4_natural_trees:items/sapling/wild_birch
execute if data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:spruce_sapling"}] run loot replace block ~ ~ ~ container.1 loot gm4_natural_trees:items/sapling/wild_spruce
execute if data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:jungle_sapling"}] run loot replace block ~ ~ ~ container.1 loot gm4_natural_trees:items/sapling/wild_jungle
execute if data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:dark_oak_sapling"}] run loot replace block ~ ~ ~ container.1 loot gm4_natural_trees:items/sapling/wild_dark_oak
execute if data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:acacia_sapling"}] run loot replace block ~ ~ ~ container.1 loot gm4_natural_trees:items/sapling/wild_acacia

# [S1,S2] move items from slot 1 to slot 2 (sapling)
data modify block ~ ~ ~ Items[{Slot:1b}].Slot set value 2b

# [S2] set the correct amount
execute store result block ~ ~ ~ Items[{Slot:2b}].Count byte 1 run scoreboard players get $slot_1_amount gm4_gv_analyze