# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/check_items


##### INITIALIZE #####

# get durability of first slot + slot 1 amount
execute store result score $slot_0_durability gm4_gv_analyze run data get block ~ ~ ~ Items[{Slot:0b}].tag.Damage
scoreboard players add $slot_0_durability gm4_gv_analyze 5

# choose random mutation
data modify storage gm4_garden_variety:interpret/mutations input set from block ~ ~ ~ Items[{Slot:1b}].tag.gm4_garden_variety.mutations
function gm4_garden_variety:data/choose/random_mutation/check


##### SLOT MODIFICATIONS #####

# [S0] remove durability base on item count in slot 1 (shears)
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Damage int 1 run scoreboard players get $slot_0_durability gm4_gv_analyze

# [S1] delete item
data modify block ~ ~ ~ Items[{Slot:1b}].Count set value 0b

# [S2] set slot 2 item (name tag)
item replace block ~ ~ ~ container.2 with minecraft:bamboo

# [S2] change item name
data modify block ~ ~ ~ Items[{Slot:2b}].tag.display.Name set value '{"text":"Leaf Clippings","italic":false}'

# [S2] set random mutation
data modify block ~ ~ ~ Items[{Slot:2b}].tag.gm4_garden_variety.mutations append from storage gm4_garden_variety:interpret/mutations output
execute if score $mutation_roll gm4_gv_nbt_data matches ..1 run data modify block ~ ~ ~ Items[{Slot:2b}].Count set value 0b


# finalize
function gm4_garden_variety:mechanics/analyzer/recipes/complete