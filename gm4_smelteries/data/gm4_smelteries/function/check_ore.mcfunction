# check for doublable ores
# @s = smeltery cauldron linked to a furnace that's smelting items
# located at the smeltery block (furnace)
# run from verify_furnace

# check if item is doubable by setting the head item of the stand
data modify entity @s HandItems[0] set from block ~ ~ ~ Items[{Slot:0b}]
item replace entity @s armor.head with air
execute store result score $double gm4_smelt_data run loot replace entity @s armor.head fish gm4_smelteries:technical/smeltable_display ~ ~ ~ mainhand
item replace entity @s weapon with air

# check if the furnace is close to finish smelting
execute if score $double gm4_smelt_data matches 1.. if score $cook_time gm4_smelt_data matches 184..199 run function gm4_smelteries:limited_tick
