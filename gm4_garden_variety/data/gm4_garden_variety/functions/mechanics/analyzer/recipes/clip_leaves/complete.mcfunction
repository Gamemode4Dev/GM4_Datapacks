# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# get durability of first slot + slot 1 amount
execute store result score $slot_0_durability gm4_gv_analyze run data get block ~ ~ ~ Items[{Slot:0b}].tag.Damage
scoreboard players add $slot_0_durability gm4_gv_analyze 5

# choose random mutation
data modify storage gm4_garden_variety:choose/mutation input set from block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety.mutations
function gm4_garden_variety:data/choose/random_mutation/check


##### SLOT MODIFICATIONS #####

# [S0] remove durability base on item count in slot 1 (shears)
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Damage int 1 run scoreboard players get $slot_0_durability gm4_gv_analyze

# [S1,S2] move items from slot 1 to slot 2 (sapling)
data modify block ~ ~ ~ Items[{Slot:1b}].Slot set value 2b

# [S2] reset mutations (sapling)
data remove block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.mutations

# [S2] set random mutation (sapling)
data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.mutations append from storage gm4_garden_variety:choose/mutation output
execute if score $mutation_roll gm4_gv_nbt_data matches ..2 run data modify block ~ ~ ~ Items[{Slot:2b}].Count set value 0b


# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete